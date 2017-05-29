from twilio.twiml.voice_response import Gather, VoiceResponse, Say

response = VoiceResponse()
gather = Gather(action='/completed', input='speech')
gather.say('Welcome to Twilio, please tell us why you\'re calling')
response.append(gather)

print(response)
