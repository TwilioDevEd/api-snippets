from twilio.twiml.voice_response import Play, VoiceResponse, Say

response = VoiceResponse()
response.say('Hello World')
response.play('https://api.twilio.com/Cowbell.mp3')

print(response)
