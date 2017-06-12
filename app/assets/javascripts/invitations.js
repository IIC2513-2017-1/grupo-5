$(document).on('turbolinks:load', function () {
  var $events;
  if (($events = $('.events')).length) {
    // procesamiento de la respuesta del request Ajax para seguir/deseguir un usuario
    $events.on('ajax:success', function (e, data) {
      var $button;
      // si la respuesta contiene un usuario al que se quiere invitar
      if (data.invited_id) {
        $button = $('.invitation-body [data-user-id="' + data.invited_id + '"]');
        $button.data('method', 'delete');
        $button.attr('href', '/invitations/' + data.invitation_id);
        $button.text('Uninvite');
      } else {
        $button = $('.invitation-body [data-user-id="' + data.uninvited_id + '"]');
        $button.data('method', 'post');
        $button.attr('href', '/events/' + data.event_id + '/invitations?user_id=' + data.uninvited_id);
        $button.text('Invite');
      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
});
