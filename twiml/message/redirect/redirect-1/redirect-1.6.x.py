from twilio.twiml.voice_response import Redirect, VoiceResponse
response = VoiceResponse()
response.redirect('http://www.foo.com/nextInstructions')

print(response)