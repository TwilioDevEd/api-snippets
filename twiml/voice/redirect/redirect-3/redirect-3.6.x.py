from twilio.twiml.voice_response import Redirect, VoiceResponse

response = VoiceResponse()
response.redirect('../nextInstructions')

print(response)
