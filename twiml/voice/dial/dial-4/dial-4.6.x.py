from twilio.twiml.voice_response import Dial, Number, VoiceResponse

response = VoiceResponse()
dial = Dial(caller_id='+15551112222')
dial.number('+15558675310')
response.append(dial)

print(response)
