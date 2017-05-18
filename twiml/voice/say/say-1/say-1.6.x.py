from twilio.twiml.voice_response import VoiceResponse, Say
response = VoiceResponse()
response.say('Chapeau!', voice='woman', language='fr')

print(response)