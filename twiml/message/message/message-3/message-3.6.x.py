from twilio.twiml.messaging_response import Message, MessagingResponse

response = MessagingResponse()
response.message(
    'Store Location: 123 Easy St.', action='/SmsHandler.php', method='POST'
)

print(response)
