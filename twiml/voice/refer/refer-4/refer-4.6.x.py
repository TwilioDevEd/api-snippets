from twilio.twiml.voice_response import Refer, VoiceResponse

response = VoiceResponse()
refer = Refer(action='/handleRefer', method='POST')
refer.refer_sip('sip:alice@example.com')
response.append(refer)

print(response)
