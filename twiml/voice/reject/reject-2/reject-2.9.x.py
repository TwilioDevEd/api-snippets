from twilio.twiml.voice_response import Reject, VoiceResponse

response = VoiceResponse()
response.reject(reason='busy')

print(response)
