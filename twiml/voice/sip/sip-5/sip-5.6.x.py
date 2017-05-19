from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial()
dial.sip('sip:jack@example.com;transport=tls')
response.append(dial)

print(response)
