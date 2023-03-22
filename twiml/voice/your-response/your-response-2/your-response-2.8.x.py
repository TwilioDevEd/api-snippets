from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('Hello')

print(response)
