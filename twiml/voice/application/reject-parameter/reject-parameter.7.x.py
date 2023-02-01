from twilio.twiml.voice_response import Parameter, Reject, VoiceResponse

response = VoiceResponse()
reject = Reject()
reject.parameter(name='reject_reason', value='no agents available')
response.append(reject)

print(response)
