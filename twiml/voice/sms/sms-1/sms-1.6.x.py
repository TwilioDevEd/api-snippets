from twilio.twiml.voice_response import VoiceResponse, Sms

response = VoiceResponse()
response.sms(
    'The king stay the king.', to='+14105556789', from_='+14105551234'
)

print(response)
