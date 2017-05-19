from twilio.twiml.voice_response import Pause, VoiceResponse, Say

response = VoiceResponse()
response.say('I will pause 10 seconds starting now!')
response.pause(length=10)
response.say('I just paused 10 seconds')

print(response)
