from twilio.twiml.voice_response import Gather, Redirect, VoiceResponse, Say

response = VoiceResponse()
gather = Gather(method='GET', action='/process_gather.php')
gather.say('Enter something, or not')
response.append(gather)
response.redirect('/process_gather.php?Digits=TIMEOUT', method='GET')

print(response)
