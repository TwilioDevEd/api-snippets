const http = require('http');
const express = require('express');
const router = express.Router();
const app = express();
const twilio = require('twilio');

// POST: '/voice'
router.post('/voice', twilio.webhook({validate: false}), (req, res) => {
    const twiml = new twilio.TwimlResponse();

    twiml.gather({
      action: 'voice/handle-record',
      numDigits: '1',
      method: 'POST',
    }, (node) => {
      node.play('http://howtodocs.s3.amazonaws.com/et-phone.mp3', {loop: 3});
    });

    res.send(twiml);
});

app.use('/', router);

http.createServer(app).listen(1337, () => {
    console.log('Express server listening on port 1337');
});
