// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const express = require('express');
const app = express();

app.post('/enqueue_call', (request, response) => {
  const resp = new VoiceResponse();

  const json = { account_number: '12345abcdef' };

  resp
    .enqueue({
      workflowSid: 'WW0123456789abcdef0123456789abcdef',
    })
    .task(
      {
        priority: '5',
        timeout: '200',
      },
      JSON.stringify(json)
    );

  response.setHeader('Content-Type', 'application/xml');
  response.write(resp.toString());
  response.end();
});

app.listen(8080);
