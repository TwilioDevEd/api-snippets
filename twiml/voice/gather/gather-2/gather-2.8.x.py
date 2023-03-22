from twilio.twiml.voice_response import Gather, VoiceResponse

response = VoiceResponse()
response.gather()

print(response)
