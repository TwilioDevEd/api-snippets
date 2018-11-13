from twilio.twiml.voice_response import Pay, VoiceResponse, Say

response = VoiceResponse()
response.say('Calling Twilio Pay')
response.pay(charge_amount='20.45')

print(response)
