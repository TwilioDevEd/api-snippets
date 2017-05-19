from twilio.twiml.voice_response import Hangup, VoiceResponse

response = VoiceResponse()
response.hangup()

print(response)
