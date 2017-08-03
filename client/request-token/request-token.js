$(function() {
  $.ajax('/token')
    .done(function(token) {
      console.log('Got a token: ', token);
      // TODO: Use token with Twilio Client
    })
    .fail(function() {
      alert('Could not authenticate!');
    });
});
