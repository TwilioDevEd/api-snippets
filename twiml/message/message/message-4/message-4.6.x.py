from twilio.twiml.messaging_response import Media, Message, MessagingResponse

response = MessagingResponse()
message = Message()
message.media('https://demo.twilio.com/owl.png')
response.append(message)

print(response)
