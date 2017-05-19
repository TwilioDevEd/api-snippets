from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('Chapeau!', voice='alice', language='fr-FR')

print(response)
