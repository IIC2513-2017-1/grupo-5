// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $(document).delegate(".pagination a", "click", function() {
    $.get(this.href, null, null, "script");
    return false;
  });
  $("#events_search input").keyup(function() {
    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
    return false;
  });
});
