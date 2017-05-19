from twilio.twiml.voice_response import VoiceResponse, Say

response = VoiceResponse()
response.say('Bom dia.', voice='alice', language='pt-BR', loop=2)

print(response)
