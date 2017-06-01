from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial()
dial.sip('kate@example.com')
response.append(dial)

print(response)
