from twilio.twiml.voice_response import Hangup, Parameter, VoiceResponse, Say

response = VoiceResponse()
response.say('We\'re sorry. All of our agents are busy right now.')
response.say('We will call you back as soon as possible.')
response.say('Please stay on the line to be redirected to the main menu.')
hangup = Hangup()
hangup.parameter(name='payment_collected', value=False)
response.append(hangup)

print(response)
