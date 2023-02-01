from twilio.twiml.voice_response import Application, ApplicationSid, Dial, VoiceResponse

response = VoiceResponse()
dial = Dial()
application = Application(copy_parent_to=True)
application.application_sid('AP1234567890abcdef1234567890abcd')
dial.append(application)
response.append(dial)

print(response)
