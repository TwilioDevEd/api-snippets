from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay()
prompt = Prompt(card_type='amex', for_='security-code')
prompt.say(
    'Please enter security code for your American Express card. It’s the 4 digits located on the front of your card'
)
pay.append(prompt)
response.append(pay)

print(response)
