from twilio.twiml.voice_response import Application, ApplicationSid, Dial, Parameter, VoiceResponse

response = VoiceResponse()
dial = Dial()
application = Application()
application.application_sid('AP1234567890abcdef1234567890abcd')
application.parameter(name='AccountNumber', value='12345')
application.parameter(name='TicketNumber', value='9876')
dial.append(application)
response.append(dial)

print(response)
