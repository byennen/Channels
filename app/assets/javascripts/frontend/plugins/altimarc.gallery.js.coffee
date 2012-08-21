$ ->
  "use strict"
  
  # Start slideshow button:
  $("#start-slideshow").button().click ->
    options = $(this).data()
    modal = $(options.target)
    data = modal.data("modal")
    if data
      $.extend data.options, options
    else
      options = $.extend(modal.data(), options)
    modal.find(".modal-slideshow").find("i").removeClass("icon-play").addClass "icon-pause"
    modal.modal options

  
  # Toggle fullscreen button:
  $("#toggle-fullscreen").button().click ->
    button = $(this)
    root = document.documentElement
    unless button.hasClass("active")
      $("#modal-gallery").addClass "modal-fullscreen"
      if root.webkitRequestFullScreen
        root.webkitRequestFullScreen window.Element.ALLOW_KEYBOARD_INPUT
      else root.mozRequestFullScreen()  if root.mozRequestFullScreen
    else
      $("#modal-gallery").removeClass "modal-fullscreen"
      (document.webkitCancelFullScreen or document.mozCancelFullScreen or $.noop).apply document


