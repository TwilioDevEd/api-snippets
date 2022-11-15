from twilio.twiml.voice_response import Pay, Prompt, VoiceResponse, Say

response = VoiceResponse()
pay = Pay(
    payment_method='credit-card', valid_card_types='visa mastercard amex')
prompt = Prompt(for_='payment-card-number')
prompt.say('Please enter your credit card number.')
pay.append(prompt)
prompt2 = Prompt(error_type='timeout', for_='payment-card-number')
prompt2.say(
    'You didn\'t enter your credit card number. Please enter your credit card number.'
)
pay.append(prompt2)
prompt3 = Prompt(error_type='invalid-card-number', for_='payment-card-number')
prompt3.say('You entered an invalid credit card number. Please try again.')
pay.append(prompt3)
prompt4 = Prompt(error_type='invalid-card-type', for_='payment-card-number')
prompt4.say(
    'The card number you entered isn\'t from one of our accepted credit card issuers. Please enter a Visa, MasterCard, or American Express credit card number.'
)
pay.append(prompt4)
prompt5 = Prompt(for_='expiration-date')
prompt5.say(
    'Please enter your credit card\'s expiration date. Two digits for the month and two digits for the year.'
)
pay.append(prompt5)
prompt6 = Prompt(error_type='timeout', for_='expiration-date')
prompt6.say(
    'Sorry. You didn\'t enter an expiration date. Please enter your card\'s expiration date. Two digits for the month and two digits for the year.'
)
pay.append(prompt6)
prompt7 = Prompt(error_type='invalid-date', for_='expiration-date')
prompt7.say(
    'The date you entered was incorrect or is in the past. Please enter the expiration date. Two digits for the month and two digits for the year. For example, to enter July twenty twenty two, enter 0 7 2 2.'
)
pay.append(prompt7)
prompt8 = Prompt(card_type='visa mastercard', for_='security-code')
prompt8.say(
    'Please enter your security code. It\'s the 3 digits located on the back of your card.'
)
pay.append(prompt8)
prompt9 = Prompt(
    error_type='timeout', card_type='visa mastercard', for_='security-code')
prompt9.say(
    'You didn\'t enter your credit card security code. Please enter your security code. It\'s the 3 digits located on the back of your card.'
)
pay.append(prompt9)
prompt10 = Prompt(
    error_type='invalid-security-code',
    card_type='visa mastercard',
    for_='security-code')
prompt10.say(
    'That was an invalid security code. The security code must be 3 digits. Please try again.'
)
pay.append(prompt10)
prompt11 = Prompt(card_type='amex', for_='security-code')
prompt11.say(
    'Please enter your security code. It\'s the 4 digits located on the front of your card.'
)
pay.append(prompt11)
prompt12 = Prompt(error_type='timeout', card_type='amex', for_='security-code')
prompt12.say(
    'You didn\'t enter your credit card security code.  Please enter your security code. It\'s the 4 digits located on the front of your card.'
)
pay.append(prompt12)
prompt13 = Prompt(
    error_type='invalid-security-code', card_type='amex', for_='security-code')
prompt13.say(
    'That was an invalid security code. The security code must be 4 digits. Please try again.'
)
pay.append(prompt13)
prompt14 = Prompt(for_='postal-code')
prompt14.say('Please enter your 5 digit billing zip code.')
pay.append(prompt14)
prompt15 = Prompt(error_type='timeout', for_='postal-code')
prompt15.say(
    'You didn\'t enter your billing zip code. Please enter your 5 digit billing zip code.'
)
pay.append(prompt15)
prompt16 = Prompt(for_='payment-processing')
prompt16.say('Thank you. Please wait while we process your payment.')
pay.append(prompt16)
response.append(pay)

print(response)
