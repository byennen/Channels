#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require twitter/bootstrap
#= require admin/plugins/jquery.cookie
#= require plugins/jquery-file-upload/vendor/jquery.ui.widget
#= require plugins/jquery-file-upload/jquery.fileupload
#= require plugins/jquery-file-upload/jquery.iframe-transport
#= require plugins/jquery-file-upload/jquery.fileupload-ui
#= require plugins/jquery-file-upload/locale


$ ->
  $(".alert-message").alert()
  $(".tabs").button()
  $(".carousel").carousel()
  $(".collapse").collapse()
  $(".dropdown-toggle").dropdown()
  $(".modal").modal()
  $("a[rel]").popover()
  $(".navbar").scrollspy()
  $(".tab").tab "show"
  $(".tooltip").tooltip()
  $(".typeahead").typeahead() 
