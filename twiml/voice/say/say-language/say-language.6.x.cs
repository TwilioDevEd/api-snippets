from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('Bonjour!', language='fr-FR')

print(response)
