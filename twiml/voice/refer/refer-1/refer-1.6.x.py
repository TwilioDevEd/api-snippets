from twilio.twiml.voice_response import Refer, VoiceResponse

response = VoiceResponse()
refer = Refer()
refer.refer_sip('sip:alice@example.com')
response.append(refer)

print(response)
