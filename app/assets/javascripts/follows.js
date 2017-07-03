
$(document).on('turbolinks:load', function () {
  var $users;
  if (($users = $('.users')).length) {
    // procesamiento de la respuesta del request Ajax para seguir/deseguir un usuario
    $users.on('ajax:success', function (e, data) {
      var $button;
      // si la respuesta contiene un usuario al que se sigue
      if (data.followed_id) {
        $button = $('.user-stream-item [data-user-id="' + data.followed_id + '"]');
        $button.data('method', 'delete');
        $button.attr('href', '/follows/' + data.follow_id);
        $button.text('Unfollow');
      } else {
        $button = $('.user-stream-item [data-user-id="' + data.unfollowed_id + '"]');
        $button.data('method', 'post');
        $button.attr('href', '/users/' + data.unfollowed_id + '/follows');
        $button.text('Follow');
      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
  if (($events = $('.events')).length) {
    $events.on('ajax:success', function (e, data) {
      var $button;
      if (data.followed_id) {
        $button = $('.information [data-user-id="' + data.followed_id + '"]');
        $button.data('method', 'delete');
        $button.attr('href', '/follows/' + data.follow_id);
        $button.text('Unfollow');
      } else {
        $button = $('.information [data-user-id="' + data.unfollowed_id + '"]');
        $button.data('method', 'post');
        $button.attr('href', '/users/' + data.unfollowed_id + '/follows');
        $button.text('Follow');
      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
  if (($events = $('#users')).length) {
    $events.on('ajax:success', function (e, data) {
      var $button;
      if (data.followed_id) {
        $button = $('.follow-request-data [data-user-id="' + data.followed_id + '"]');
        $button.data('method', 'delete');
        $button.attr('href', '/follows/' + data.follow_id);
        $button.text('Unfollow');
      } else {
        $button = $('.follow-request-data [data-user-id="' + data.unfollowed_id + '"]');
        $button.data('method', 'post');
        $button.attr('href', '/users/' + data.unfollowed_id + '/follows');
        $button.text('Follow');
      }
    }).on('ajax:error', function (e, data) {
      console.log(data);
    });
  }
});
