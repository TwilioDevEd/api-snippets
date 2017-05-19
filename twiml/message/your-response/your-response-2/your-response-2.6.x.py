from twilio.twiml.messaging_response import Message, MessagingResponse

response = MessagingResponse()
response.message('This is message 1 of 2.')
response.message('This is message 2 of 2.')

print(response)
