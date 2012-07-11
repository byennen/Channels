module ApplicationHelper

  def flash_class(level)
    case level
      when :notice then 'info'
      when :error then 'error'
      when :alert then 'warning'
    end
  end

  def twitterized_type(type)
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        type.to_s
    end
  end

  def nav_link(text, link)
      recognized = Rails.application.routes.recognize_path(link)
      if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
          content_tag(:li) do
              content_tag(:span, :class => "active") do
                link_to( text, link, :class => "pjax")
              end
          end
      else
          content_tag(:li) do
              content_tag :span do
                link_to( text, link, :class => "pjax")
              end
          end
      end
  end
  
end
