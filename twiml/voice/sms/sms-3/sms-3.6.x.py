from twilio.twiml.voice_response import VoiceResponse, Say, Sms

response = VoiceResponse()
response.say('Our store is located at 123 Easy St.')
response.sms(
    'Store Location: 123 Easy St.', action='/smsHandler.php', method='POST'
)

print(response)
