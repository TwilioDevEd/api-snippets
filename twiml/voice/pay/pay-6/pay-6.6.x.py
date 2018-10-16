from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay()
prompt = Prompt(for_='payment-card-number')
prompt.say('Please enter your 15 digit visa or master card number.')
pay.append(prompt)
response.append(pay)

print(response)
