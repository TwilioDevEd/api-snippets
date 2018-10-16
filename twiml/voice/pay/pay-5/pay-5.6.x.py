from twilio.twiml.voice_response import Pay, Play, Prompt, VoiceResponse

response = VoiceResponse()
pay = Pay()
prompt = Prompt(for_='payment-card-number')
prompt.play('https://myurl.com/twilio/twiml/audio/card_number.mp3')
pay.append(prompt)
response.append(pay)

print(response)
