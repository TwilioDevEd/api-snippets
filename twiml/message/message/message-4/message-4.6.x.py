from twilio.twiml.messaging_response import Body, Media, Message, MessagingResponse

response = MessagingResponse()
message = Message()
message.body('Hello Jenny')
message.media('https://demo.twilio.com/owl.png')
response.append(message)

print(response)
