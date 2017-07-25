$(() => {
  $.ajax('/token')
    .done(token => {
      console.log('Got a token: ', token);
      // TODO: Use token with Twilio Client
    })
    .fail(() => {
      alert('Could not authenticate!');
    });
});
