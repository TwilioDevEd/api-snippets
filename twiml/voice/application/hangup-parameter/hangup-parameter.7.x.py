from twilio.twiml.voice_response import Hangup, Parameter, VoiceResponse

response = VoiceResponse()
hangup = Hangup()
hangup.parameter(name='hangup_reason', value='no agents available')
response.append(hangup)

print(response)
