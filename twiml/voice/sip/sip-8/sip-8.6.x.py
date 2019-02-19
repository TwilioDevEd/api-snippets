from twilio.twiml.voice_response import Dial, VoiceResponse, Sip

response = VoiceResponse()
dial = Dial()
dial.sip('sip:kate@example.com?mycustomheader=foo&myotherheader=bar')
response.append(dial)

print(response)
