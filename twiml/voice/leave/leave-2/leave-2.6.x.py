from twilio.twiml.voice_response import Play, VoiceResponse

response = VoiceResponse()
response.play(
    'http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3'
)

print(response)
