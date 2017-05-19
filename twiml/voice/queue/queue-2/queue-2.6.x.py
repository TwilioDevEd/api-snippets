from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('You will now be connected to an agent.')

print(response)
