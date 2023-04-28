from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say(
    'Bonjour! Je m\'appelle Mathieu.', voice='Polly.Mathieu', language='fr-FR')

print(response)
