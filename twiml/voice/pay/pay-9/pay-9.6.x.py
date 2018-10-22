from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay()
prompt = Prompt(attempt='1', for_='expiration-date')
prompt.say(
    'Please enter your expiration date, two digits for the month and two digits for the year.'
)
pay.append(prompt)
prompt2 = Prompt(attempt='2 3', for_='expiration-date')
prompt2.say(
    'Please enter your expiration date, two digits for the month and two digits for the year. For example, if your expiration date is March 2022, then please enter 0 3 2 2'
)
pay.append(prompt2)
response.append(pay)

print(response)
