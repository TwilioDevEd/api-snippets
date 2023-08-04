from twilio.twiml import Response

response = Response()
response.say('Chapeau!', voice='alice', language='fr-FR')

print(response)
