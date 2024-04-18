from twilio.twiml.voice_response import Gather, VoiceResponse, Say

response = VoiceResponse()
gather = Gather(input='speech dtmf', timeout=3, num_digits=1)
gather.say('Please press 1 or say sales for sales.')
response.append(gather)

print(response)
