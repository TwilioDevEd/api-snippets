from twilio.twiml.messaging_response import Body, Message, MessagingResponse

response = MessagingResponse()
message = Message()
message.body('Store Location: 123 Easy St.')
response.append(message)

print(response)
