from twilio.twiml.voice_response import Pay, VoiceResponse

response = VoiceResponse()
response.pay(charge_amount='0', payment_connector='My_Pay_Connector', action='https://your-callback-function-url.com/pay')

print(response)
