from twilio.twiml.voice_response import Refer, VoiceResponse

response = VoiceResponse()
refer = Refer()
refer.sip(
    'sip:alice@example.com?X-AcctNumber=123456&X-ReasonForCalling=billing-question'
)
response.append(refer)

print(response)
