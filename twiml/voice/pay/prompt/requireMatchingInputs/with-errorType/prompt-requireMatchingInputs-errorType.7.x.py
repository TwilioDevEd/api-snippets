from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay(payment_method='ach-debit', charge_amount='13.22')
prompt = Prompt(for_='bank-account-number')
prompt.say(
    'Thanks for using our service. Please enter your bank account number.')
pay.append(prompt)
prompt2 = Prompt(require_matching_inputs=True, for_='bank-account-number')
prompt2.say('Thank you. Please enter your bank account number again.')
pay.append(prompt2)
prompt3 = Prompt(
    error_type='input-matching-failed', for_='bank-account-number')
prompt3.say(
    'Sorry, your two bank account number inputs did not match. Please enter your bank account number again. We will then ask a second time again.'
)
pay.append(prompt3)
response.append(pay)

print(response)
