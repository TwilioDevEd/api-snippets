from twilio.twiml.voice_response import Refer, VoiceResponse

response = VoiceResponse()
refer = Refer()
refer.sip('sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex')
response.append(refer)

print(response)
