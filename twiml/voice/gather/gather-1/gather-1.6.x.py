from twilio.twiml.voice_response import Gather, VoiceResponse, Say

response = VoiceResponse()
gather = Gather(timeout=10, finish_on_key='*')
gather.say('Please enter your pin number and then press star.')
response.append(gather)

print(response)
