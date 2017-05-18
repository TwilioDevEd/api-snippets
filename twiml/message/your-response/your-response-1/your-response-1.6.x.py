from twilio.twiml.messaging_response import Message, Redirect, MessagingResponse
response = MessagingResponse()
response.message('Hello World!')
response.redirect('https://demo.twilio.com/sms/welcome')

print(response)