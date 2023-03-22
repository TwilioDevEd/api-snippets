from twilio.twiml.voice_response import Play, VoiceResponse

response = VoiceResponse()
response.play('', digits='wwww3')

print(response)
