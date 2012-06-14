#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require twitter/bootstrap
#= require admin/plugins/jquery.cookie
#= require admin/plugins/jquery.hoverIntent.minified
#= require admin/plugins/jquery.ui.totop
#= require admin/plugins/jquery.dataTables
#= require admin/plugins/excanvas.min
#= require admin/plugins/jquery.flot.min
#= require admin/plugins/jquery.flot.selection
#= require admin/plugins/jquery.flot.resize
#= require admin/plugins/fullcalendar.min
#= require admin/plugins/altimarc
#= require admin/plugins/altimarc.charts
#= require admin/plugins/altimarc.calendar
#= require_tree .

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
