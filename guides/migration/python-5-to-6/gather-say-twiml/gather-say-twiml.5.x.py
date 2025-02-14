from twilio.twiml import Response

response = Response()
with response.gather(action='/process_gather.php', method='GET') as g:
    g.say('Enter something, or not')
response.redirect('/process_gather.php?Digits=TIMEOUT', method='GET')

print(response)
