from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial(sequential=True)
dial.sip('sip:alice@example.com')
dial.sip('sip:bob@example.com')
dial.sip('sip:charlie@example.com')
response.append(dial)

print(response)
