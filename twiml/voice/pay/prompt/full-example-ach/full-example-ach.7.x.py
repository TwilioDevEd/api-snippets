from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay(
    timeout='5',
    max_attempts='3',
    payment_method='ach-debit',
    language='en-US')
prompt = Prompt(for_='bank-routing-number')
prompt.say('Please enter your bank routing number.')
pay.append(prompt)
prompt2 = Prompt(error_type='timeout', for_='bank-routing-number')
prompt2.say('You didn\'t enter your routing number. Please enter your bank routing number.')
pay.append(prompt2)
prompt3 = Prompt(error_type='invalid-bank-routing-number', for_='bank-routing-number')
prompt3.say('That was an invalid bank routing number. Please try again.')
pay.append(prompt3)
prompt4 = Prompt(for_='bank-account-number')
prompt4.say('Please enter your bank account number.')
pay.append(prompt4)
prompt5 = Prompt(error_type='timeout', for_='bank-account-number')
prompt5.say('You didn\'t enter your bank account number. Please enter your bank account number.')
pay.append(prompt5)
prompt6 = Prompt(for_='payment-processing')
prompt6.say('Thank you. Please wait while we process your payment.')
pay.append(prompt6)
response.append(pay)

print(response)
