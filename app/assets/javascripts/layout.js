
$(document).on('turbolinks:load',function () {
  $('#close-button').on('click', function() {
    $('#alert-bar').hide();
  });

  if ($('#alert-bar').children().length == 1){
    $('#alert-bar').hide();
  }
});
