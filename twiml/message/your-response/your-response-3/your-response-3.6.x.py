from twilio.twiml.messaging_response import Message, MessagingResponse

response = MessagingResponse()
response.message('I\'m hungry!')

print(response)
