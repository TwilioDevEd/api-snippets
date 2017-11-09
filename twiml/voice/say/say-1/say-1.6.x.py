from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('Sout Pal Gyi Fuck You!', voice='woman', language='fr')

print(response)
