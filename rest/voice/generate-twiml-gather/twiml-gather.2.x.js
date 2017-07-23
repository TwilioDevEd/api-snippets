let express = require('express');
let router = express.Router();
let twilio = require('twilio');

// POST: '/voice'
router.post('/voice', twilio.webhook({ validate: false }), function(
  request,
  response
) {
  let twiml = new twilio.TwimlResponse();
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
