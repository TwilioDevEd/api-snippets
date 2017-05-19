from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial()
dial.number('415-123-4567', send_digits='wwww1928')
response.append(dial)

print(response)
