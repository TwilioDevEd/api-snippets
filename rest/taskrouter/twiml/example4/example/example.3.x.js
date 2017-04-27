// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const VoiceResponse = require('twilio').twiml.VoiceResponse;
const express = require('express');
const app = express();

app.post('/enqueue_call', function(request, response) {
    const resp = new VoiceResponse();

    const arr = {account_number: '12345abcdef'};
    const json = JSON.stringify(arr);

    resp.enqueue(
      {
        workflowSid: 'WW0123456789abcdef0123456789abcdef',
        waitUrl: '/hold_music.php',
        action: '/post_bridge_survey.php',
      }, (node) => {
        // FIXME <Task> element is not accessible in the helper lib
        node.task(json);
      }
    );

    response.setHeader('Content-Type', 'application/xml');
    response.write(resp.toString());
    response.end();
});

app.listen(8080);
