from twilio.twiml.voice_response import Refer, ReferSip, VoiceResponse

response = VoiceResponse()
refer = Refer()
refer.sip('sip:alice@example.com')
response.append(refer)

print(response)
