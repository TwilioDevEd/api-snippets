from twilio.twiml.voice_response import Parameter, Pay, VoiceResponse

response = VoiceResponse()
pay = Pay(
    charge_amount='10.00',
    payment_connector='My_Generic_Pay_Connector',
    action='https://your-callback-function-url.com/pay'
)
pay.parameter(name='custom_parameter_1', value='custom_value_1')
response.append(pay)

print(response)