from twilio.twiml.voice_response import VoiceResponse, Sms

response = VoiceResponse()
response.sms('The king stay the king.', from='+14105551234', to='+14105556789')

print(response)
