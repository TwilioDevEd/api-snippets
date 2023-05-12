from twilio.twiml.messaging_response import Redirect, MessagingResponse

response = MessagingResponse()
response.redirect('../nextInstructions')

print(response)
