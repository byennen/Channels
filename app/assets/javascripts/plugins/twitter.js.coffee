(($) ->
  $.fn.tweet = (o) ->
    parse_date = (date_str) ->
      Date.parse date_str.replace(/^([a-z]{3})( [a-z]{3} \d\d?)(.*)( \d{4})$/i, "$1,$2$4$3")
    relative_time = (time_value) ->
      parsed_date = parse_date(time_value)
      relative_to = (if (arguments.length > 1) then arguments[1] else new Date())
      delta = parseInt((relative_to.getTime() - parsed_date) / 1000)
      pluralize = (singular, n) ->
        "" + n + " " + singular + (if n is 1 then "" else "s")

      if delta < 60
        "less than a minute ago"
      else if delta < (60 * 60)
        "about " + pluralize("minute", parseInt(delta / 60)) + " ago"
      else if delta < (24 * 60 * 60)
        "about " + pluralize("hour", parseInt(delta / 3600)) + " ago"
      else
        "about " + pluralize("day", parseInt(delta / 86400)) + " ago"
    build_url = ->
      proto = (if "https:" is document.location.protocol then "https:" else "http:")
      if s.list
        proto + "//api.twitter.com/1/" + s.username[0] + "/lists/" + s.list + "/statuses.json?per_page=" + s.count + "&callback=?"
      else if not s.query? and s.username.length is 1
        proto + "//api.twitter.com/1/statuses/user_timeline.json?screen_name=" + s.username[0] + "&count=" + s.count + "&callback=?"
      else
        query = (s.query or "from:" + s.username.join(" OR from:"))
        proto + "//search.twitter.com/search.json?&q=" + escape(query) + "&rpp=" + s.count + "&callback=?"
    s =
      list: null
      avatar_size: null
      count: 3
      intro_text: null
      outro_text: null
      join_text: null
      loading_text: null
      query: null

    $.extend s, o  if o
    $.fn.extend
      linkUrl: ->
        returning = []
        regexp = /((ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?)/g
        @each ->
          returning.push @replace(regexp, "<a href=\"$1\">$1</a>")

        $ returning

      linkUser: ->
        returning = []
        regexp = /[\@]+([A-Za-z0-9-_]+)/g
        @each ->
          returning.push @replace(regexp, "<a href=\"http://twitter.com/$1\">@$1</a>")

        $ returning

      linkHash: ->
        returning = []
        regexp = RegExp(" [\\#]+([A-Za-z0-9-_]+)", "g")
        @each ->
          returning.push @replace(regexp, " <a href=\"http://search.twitter.com/search?q=&tag=$1&lang=all&from=" + s.username.join("%2BOR%2B") + "\">#$1</a>")

        $ returning

      capAwesome: ->
        returning = []
        @each ->
          returning.push @replace(/\b(awesome)\b/g, "<span class=\"awesome\">$1</span>")

        $ returning

      capEpic: ->
        returning = []
        @each ->
          returning.push @replace(/\b(epic)\b/g, "<span class=\"epic\">$1</span>")

        $ returning

      makeHeart: ->
        returning = []
        @each ->
          returning.push @replace(/(&lt;)+[3]/g, "<tt class='heart'>&#x2665;</tt>")

        $ returning

    @each (i, widget) ->
      list = $("<ul class=\"tweet_list\">").appendTo(widget)
      intro = "<p class=\"tweet_intro\">" + s.intro_text + "</p>"
      outro = "<p class=\"tweet_outro\">" + s.outro_text + "</p>"
      loading = $("<p class=\"loading\">" + s.loading_text + "</p>")
      s.username = [ s.username ]  if typeof (s.username) is "string"
      $(widget).append loading  if s.loading_text
      $.getJSON build_url(), (data) ->
        loading.remove()  if s.loading_text
        list.before intro  if s.intro_text
        tweets = (data.results or data)
        $.each tweets, (i, item) ->
          if s.join_text is "auto"
            if item.text.match(/^(@([A-Za-z0-9-_]+)) .*/i)
              join_text = s.auto_join_text_reply
            else if item.text.match(/(^\w+:\/\/[A-Za-z0-9-_]+\.[A-Za-z0-9-_:%&\?\/.=]+) .*/i)
              join_text = s.auto_join_text_url
            else if item.text.match(/^((\w+ed)|just) .*/i)
              join_text = s.auto_join_text_ed
            else if item.text.match(/^(\w*ing) .*/i)
              join_text = s.auto_join_text_ing
            else
              join_text = s.auto_join_text_default
          else
            join_text = s.join_text
          from_user = item.from_user or item.user.screen_name
          profile_image_url = item.profile_image_url or item.user.profile_image_url
          join_template = "<span class=\"tweet_join\"> " + join_text + " </span>"
          join = (if (s.join_text) then join_template else " ")
          avatar_template = "<a class=\"tweet_avatar\" href=\"http://twitter.com/" + from_user + "\"><img src=\"" + profile_image_url + "\" height=\"" + s.avatar_size + "\" width=\"" + s.avatar_size + "\" alt=\"" + from_user + "'s avatar\" title=\"" + from_user + "'s avatar\" border=\"0\"/></a>"
          avatar = (if s.avatar_size then avatar_template else "")
          date = "<span class=\"tweet_time\"><a href=\"http://twitter.com/" + from_user + "/statuses/" + item.id + "\"></a></span>"
          text = "<span class=\"tweet_text\">" + $([ item.text ]).linkUrl().linkUser().linkHash().makeHeart().capAwesome().capEpic()[0] + "</span>"
          list.append "<li>" + avatar + date + join + text + "</li>"
          list.children("li").addClass "item"
          list.children("li:eq(2)").addClass "last"

        list.after outro  if s.outro_text
        $(widget).trigger("loaded").trigger (if tweets.length is 0 then "empty" else "full")
) jQuery
