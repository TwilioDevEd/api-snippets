from twilio.twiml.voice_response import Play, VoiceResponse

response = VoiceResponse()
response.play('https://api.twilio.com/cowbell.mp3', loop=10)

print(response)
