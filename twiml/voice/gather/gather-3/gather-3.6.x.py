from twilio.twiml.voice_response import Gather, VoiceResponse, Say

response = VoiceResponse()
gather = Gather(action='/process_gather.php', method='GET')
gather.say('Please enter your account number,\nfollowed by the pound sign')
response.append(gather)
response.say('We didn\'t receive any input. Goodbye!')

print(response)
