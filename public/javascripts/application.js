// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $("#date_field").datetimepicker();
});

$(function() {
  $(".date_pick").datetimepicker();
});

$('a.data-popup').live('click', function(e) { 
      window.open($(this).attr("href")); 
      e.preventDefault(); 
   });
