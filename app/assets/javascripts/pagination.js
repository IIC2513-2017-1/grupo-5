$(function() {
  $(".pagination a").live("click", function() {
    alert("HOLA");
    //$(".pagination").html("Page is loading...");
    $.get(this.href, null, null, "script");
    return false;
  });
});
