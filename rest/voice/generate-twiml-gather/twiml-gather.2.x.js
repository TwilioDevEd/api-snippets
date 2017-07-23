var express = require('express');
var router = express.Router();
var twilio = require('twilio');

// POST: '/voice'
router.post('/voice', twilio.webhook({ validate: false }), function(
  request,
  response
) {
  var twiml = new twilio.TwimlResponse();
  twiml.gather(
    {
      action: 'voice/handle-record',
      numDigits: '1',
      method: 'POST',
    },
    function(node) {
      node.play('http://howtodocs.s3.amazonaws.com/et-phone.mp3', { loop: 3 });
    }
  );
  response.send(twiml);
});

module.exports = router;
