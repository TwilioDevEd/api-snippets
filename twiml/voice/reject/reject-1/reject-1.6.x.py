from twilio.twiml.voice_response import Reject, VoiceResponse

response = VoiceResponse()
response.reject()

print(response)
