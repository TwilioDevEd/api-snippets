from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay()
prompt = Prompt(for_='payment-card-number')
prompt.say('Please enter your 16 digit Visa or Mastercard number.')
pay.append(prompt)
response.append(pay)

print(response)
