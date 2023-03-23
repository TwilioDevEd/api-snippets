from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay()
prompt = Prompt(card_type='visa', for_='security-code')
prompt.say(
    'Please enter security code for your Visa card. It’s the 3 digits located on the back of your card'
)
pay.append(prompt)
response.append(pay)

print(response)
