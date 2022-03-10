from twilio.twiml.voice_response import Parameter, Pay, VoiceResponse

response = VoiceResponse()
pay = Pay(
    charge_amount='10.00',
    payment_connector='My_Generic_Pay_Connector',
    action='https://your-callback-function-url.com/pay'
)
pay.parameter(name='card_type', value='mastercard')
response.append(pay)

print(response)