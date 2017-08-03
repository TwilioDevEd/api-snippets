Twilio.Device.incoming(function(conn) {
  console.log('Incoming connection from ' + conn.parameters.From);
  const archEnemyPhoneNumber = '+15417280966';

  if (conn.parameters.From === archEnemyPhoneNumber) {
    conn.reject();
  } else {
    // accept the incoming connection and start two-way audio
    conn.accept();
  }
});
