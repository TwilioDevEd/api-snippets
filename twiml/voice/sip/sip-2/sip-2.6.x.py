from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial()
dial.sip('sip:kate@example.com', username='admin', password='1234')
response.append(dial)

print(response)
