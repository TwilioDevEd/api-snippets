from twilio.twiml.voice_response import Dial, Number, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial()
dial.number('+12143211432')
dial.sip('sip:alice-soft-phone@example.com')
dial.sip('sip:alice-desk-phone@example.com')
dial.sip('sip:alice-mobile-client@example.com')
response.append(dial)

print(response)
