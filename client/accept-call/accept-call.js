Twilio.Device.incoming(conn => {
  console.log('Incoming connection from ' + conn.parameters.From);
  // accept the incoming connection and start two-way audio
  conn.accept();
});
