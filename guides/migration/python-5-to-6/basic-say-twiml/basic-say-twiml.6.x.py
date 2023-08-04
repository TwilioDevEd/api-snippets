from twilio.twiml.voice_response import VoiceResponse

response = VoiceResponse().say('Chapeau!', voice='alice', language='fr-FR')

print(response)
