const express = require('express');
const bodyParser = require('body-parser')
const axios = require('axios')
const VoiceResponse = require('twilio').twiml.VoiceResponse;

const app = express();
app.use(bodyParser.urlencoded({extended: false}))

app.post('/voice', (req, res) => {
  const twiml = new VoiceResponse()

  twiml.say('Hi! I want to know what do you think about coding.')
  twiml.record({maxLength: '10', action: '/recording'})
  twiml.hangup()

  res.send(twiml.toString())
});

app.post('/recording', (req, res) => {
  const twiml = new VoiceResponse()
  const recordingUrl = req.body.RecordingUrl

  twiml.say('Thanks for howling... take a listen to what you howled.')
  twiml.play(recordingUrl)
  twiml.say('Goodbye.')

  res.send(twiml.toString())
})

app.post('/callback', (req, res) => {
  const addOns = JSON.parse(req.body.AddOns)

  if (!('ibm_watson_speechtotext' in addOns.results)) {
    return 'Add Watson Speech to Text add-on in your Twilio console'
  }

  const payloadUrl = addOns.results.ibm_watson_speechtotext.payload[0].url
  // To set up environmental variables, see http://twil.io/secure
  const accountSID = process.env.TWILIO_ACCOUNT_SID
  const authToken = process.env.TWILIO_AUTH_TOKEN;

  axios.get(payloadUrl, {auth: {username: accountSID, password: authToken}})
    .then(response => {
      const results = response.data.results[0].results
      const transcripts = results.map(item => item.alternatives[0].transcript)
      return transcripts
    })
     .then(transcripts => res.send(transcripts.join(' ')))
})

app.listen();
