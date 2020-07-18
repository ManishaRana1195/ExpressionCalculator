(function() {
  App.chat = App.cable.subscriptions.create("ChatChannel", {
    connected: function() {
      console.log("I am connected")
    },
    disconnected: function() {
      console.log("I am disconnected")
    },
    received: function(data) {
      $("#chat_form").append(data['expression']);
    }
  });

}).call(this);