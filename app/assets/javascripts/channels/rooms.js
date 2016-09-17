App.rooms = App.cable.subscriptions.create("RoomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(html) {
    $('[data-chat]').append(html);
  },

  send_message: function(data) {
    return this.perform('send_message', data);
  }
});

$(document).ready(function () {
  $('[data-id="send-message"]').click(function (e) {
    var messageInput = $('[data-id="message"]');
    var data = { message: messageInput.val() };

    App.rooms.send_message(data);
    messageInput.val('');

    e.preventDefault();
  });
});
