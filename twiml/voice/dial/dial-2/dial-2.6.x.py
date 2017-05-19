from twilio.twiml.voice_response import Dial, VoiceResponse, Say

response = VoiceResponse()
response.dial('415-123-4567')
response.say('Goodbye')

print(response)
