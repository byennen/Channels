module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
    @show_title = show_title
  end

  def show_title?
    @show_title
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  #twitter bootstrap icon-button helper
  #Example: = link_with_icon("Title", link_url(subdomain: "www"), "icon-trash icon-white", "btn btn-large btn-primary pjax")
  def link_with_icon(title, link, icon, type)
    @icon = icon
    @type = type
    link_to(content_tag(:span, %{#{content_tag(:i, nil, :class => @icon)} #{title}}.html_safe, :class => @type), link)
  end
end
