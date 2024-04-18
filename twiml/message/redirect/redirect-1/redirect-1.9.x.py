from twilio.twiml.messaging_response import Redirect, MessagingResponse

response = MessagingResponse()
response.redirect('http://www.example.com/nextInstructions')

print(response)
