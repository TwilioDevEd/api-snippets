from twilio.twiml.voice_response import Dial, Redirect, VoiceResponse

response = VoiceResponse()
response.dial('415-123-4567')
response.redirect('http://www.foo.com/nextInstructions')

print(response)
