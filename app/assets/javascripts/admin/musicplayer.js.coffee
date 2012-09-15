BasicMP3Player = ->
  self = this
  pl = this
  sm = soundManager # soundManager instance
  isTouchDevice = (navigator.userAgent.match(/ipad|iphone/i))
  isIE = (navigator.userAgent.match(/msie/i))
  @excludeClass = "button-exclude" # CSS class for ignoring MP3 links
  @links = []
  @sounds = []
  @soundsByURL = []
  @indexByURL = []
  @lastSound = null
  @soundCount = 0
  @config =
    
    # configuration options
    playNext: false # stop after one sound, or play through list until end
    autoPlay: false # start playing the first sound right away

  @css =
    
    # CSS class names appended to link during various states
    sDefault: "sm2_button" # default state
    sLoading: "sm2_loading"
    sPlaying: "sm2_playing"
    sPaused: "sm2_paused"

  
  # event + DOM utils
  @includeClass = @css.sDefault
  @addEventHandler = ((if typeof window.addEventListener isnt "undefined" then (o, evtName, evtHandler) ->
    o.addEventListener evtName, evtHandler, false
   else (o, evtName, evtHandler) ->
    o.attachEvent "on" + evtName, evtHandler
  ))
  @removeEventHandler = ((if typeof window.removeEventListener isnt "undefined" then (o, evtName, evtHandler) ->
    o.removeEventListener evtName, evtHandler, false
   else (o, evtName, evtHandler) ->
    o.detachEvent "on" + evtName, evtHandler
  ))
  @classContains = (o, cStr) ->
    (if typeof (o.className) isnt "undefined" then o.className.match(new RegExp("(\\s|^)" + cStr + "(\\s|$)")) else false)

  @addClass = (o, cStr) ->
    return false  if not o or not cStr or self.classContains(o, cStr)
    o.className = ((if o.className then o.className + " " else "")) + cStr

  @removeClass = (o, cStr) ->
    return false  if not o or not cStr or not self.classContains(o, cStr)
    o.className = o.className.replace(new RegExp("( " + cStr + ")|(" + cStr + ")", "g"), "")

  @getSoundByURL = (sURL) ->
    (if typeof self.soundsByURL[sURL] isnt "undefined" then self.soundsByURL[sURL] else null)

  @isChildOfNode = (o, sNodeName) ->
    return false  if not o or not o.parentNode
    sNodeName = sNodeName.toLowerCase()
    loop
      o = o.parentNode
      break unless o and o.parentNode and o.nodeName.toLowerCase() isnt sNodeName
    (if o.nodeName.toLowerCase() is sNodeName then o else null)

  @events =
    
    # handlers for sound events as they're started/stopped/played
    play: ->
      pl.removeClass @_data.oLink, @_data.className
      @_data.className = pl.css.sPlaying
      pl.addClass @_data.oLink, @_data.className

    stop: ->
      pl.removeClass @_data.oLink, @_data.className
      @_data.className = ""

    pause: ->
      pl.removeClass @_data.oLink, @_data.className
      @_data.className = pl.css.sPaused
      pl.addClass @_data.oLink, @_data.className

    resume: ->
      pl.removeClass @_data.oLink, @_data.className
      @_data.className = pl.css.sPlaying
      pl.addClass @_data.oLink, @_data.className

    finish: ->
      pl.removeClass @_data.oLink, @_data.className
      @_data.className = ""
      if pl.config.playNext
        nextLink = (pl.indexByURL[@_data.oLink.href] + 1)
        pl.handleClick target: pl.links[nextLink]  if nextLink < pl.links.length

  @stopEvent = (e) ->
    if typeof e isnt "undefined" and typeof e.preventDefault isnt "undefined"
      e.preventDefault()
    else window.event.returnValue = false  if typeof window.event isnt "undefined"
    false

  @getTheDamnLink = (if (isIE) then (e) ->
    
    # I really didn't want to have to do this.
    (if e and e.target then e.target else window.event.srcElement)
   else (e) ->
    e.target
  )
  @handleClick = (e) ->
    
    # a sound link was clicked
    
    # ignore right-click
    return true  if typeof e.button isnt "undefined" and e.button > 1
    o = self.getTheDamnLink(e)
    sURL = undefined
    soundURL = undefined
    thisSound = undefined
    if o.nodeName.toLowerCase() isnt "a"
      o = self.isChildOfNode(o, "a")
      return true  unless o
    sURL = o.getAttribute("href")
    return true  if not o.href or not soundManager.canPlayLink(o) or self.classContains(o, self.excludeClass) # pass-thru for non-MP3/non-links
    return true  unless self.classContains(o, self.includeClass)
    sm._writeDebug "handleClick()"
    soundURL = (o.href)
    thisSound = self.getSoundByURL(soundURL)
    if thisSound
      
      # already exists
      if thisSound is self.lastSound
        
        # and was playing (or paused)
        thisSound.togglePause()
      else
        
        # different sound
        thisSound.togglePause() # start playing current
        sm._writeDebug "sound different than last sound: " + self.lastSound.id
        self.stopSound self.lastSound  if self.lastSound
    else
      
      # create sound
      thisSound = sm.createSound(
        id: "basicMP3Sound" + (self.soundCount++)
        url: soundURL
        onplay: self.events.play
        onstop: self.events.stop
        onpause: self.events.pause
        onresume: self.events.resume
        onfinish: self.events.finish
      )
      
      # tack on some custom data
      thisSound._data =
        oLink: o # DOM node for reference within SM2 object event handlers
        className: self.css.sPlaying

      self.soundsByURL[soundURL] = thisSound
      self.sounds.push thisSound
      
      # stop last sound
      self.stopSound self.lastSound  if self.lastSound
      thisSound.play()
    self.lastSound = thisSound # reference for next call
    self.stopEvent e

  @stopSound = (oSound) ->
    soundManager.stop oSound.id
    # iOS 4.2+ security blocks onfinish() -> playNext() if we set a .src in-between(?)
    soundManager.unload oSound.id  unless isTouchDevice

  @init = ->
    sm._writeDebug "basicMP3Player.init()"
    i = undefined
    j = undefined
    foundItems = 0
    oLinks = document.getElementsByTagName("a")
    
    # grab all links, look for .mp3
    i = 0
    j = oLinks.length

    while i < j
      if self.classContains(oLinks[i], self.css.sDefault) and not self.classContains(oLinks[i], self.excludeClass)
        
        # self.addClass(oLinks[i],self.css.sDefault); // add default CSS decoration - good if you're lazy and want ALL MP3/playable links to do this
        self.links[foundItems] = (oLinks[i])
        self.indexByURL[oLinks[i].href] = foundItems # hack for indexing
        foundItems++
      i++
    if foundItems > 0
      self.addEventHandler document, "click", self.handleClick
      if self.config.autoPlay
        self.handleClick
          target: self.links[0]
          preventDefault: ->

    sm._writeDebug "basicMP3Player.init(): Found " + foundItems + " relevant items."

  @init()
basicMP3Player = null

# use HTML5 audio for MP3/MP4, if available
soundManager.preferFlash = false
soundManager.onready ->
  
  # soundManager.createSound() etc. may now be called
  basicMP3Player = new BasicMP3Player()
