const express = require('express');
const { MessagingResponse } = require('twilio').twiml;

const app = express();

app.post('/sms', (req, res) => {
  const twiml = new MessagingResponse();

  const message = twiml.message();
  message.body('The Robots are coming! Head for the hills!');
  message.media(
    'https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg'
  );

  res.type('text/xml').send(twiml.toString());
});

app.listen(3000, () => {
  console.log('Express server listening on port 3000');
});
