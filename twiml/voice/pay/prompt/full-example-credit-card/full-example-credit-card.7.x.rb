require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(payment_method: 'credit-card', valid_card_types: 'visa mastercard amex') do |pay|
    pay.prompt(for: 'payment-card-number') do |prompt|
        prompt.say(message: 'Please enter your credit card number.')
end
    pay.prompt(for: 'payment-card-number', error_type: 'timeout') do |prompt2|
        prompt2.say(message: "You didn't enter your credit card number. Please enter your credit card number.")
end
    pay.prompt(for: 'payment-card-number', error_type: 'invalid-card-number') do |prompt3|
        prompt3.say(message: 'You entered an invalid credit card number. Please try again.')
end
    pay.prompt(for: 'payment-card-number', error_type: 'invalid-card-type') do |prompt4|
        prompt4.say(message: "The card number you entered isn't from one of our accepted credit card issuers. Please enter a Visa, MasterCard, or American Express credit card number.")
end
    pay.prompt(for: 'expiration-date') do |prompt5|
        prompt5.say(message: "Please enter your credit card's expiration date. Two digits for the month and two digits for the year.")
end
    pay.prompt(for: 'expiration-date', error_type: 'timeout') do |prompt6|
        prompt6.say(message: "Sorry. You didn't enter an expiration date. Please enter your card's expiration date. Two digits for the month and two digits for the year.")
end
    pay.prompt(for: 'expiration-date', error_type: 'invalid-date') do |prompt7|
        prompt7.say(message: 'The date you entered was incorrect or is in the past. Please enter the expiration date. Two digits for the month and two digits for the year. For example, to enter July twenty twenty two, enter 0 7 2 2.')
end
    pay.prompt(for: 'security-code', card_type: 'visa mastercard') do |prompt8|
        prompt8.say(message: "Please enter your security code. It's the 3 digits located on the back of your card.")
end
    pay.prompt(for: 'security-code', error_type: 'timeout', card_type: 'visa mastercard') do |prompt9|
        prompt9.say(message: "You didn't enter your credit card security code. Please enter your security code. It's the 3 digits located on the back of your card.")
end
    pay.prompt(for: 'security-code', error_type: 'invalid-security-code', card_type: 'visa mastercard') do |prompt10|
        prompt10.say(message: 'That was an invalid security code. The security code must be 3 digits. Please try again.')
end
    pay.prompt(for: 'security-code', card_type: 'amex') do |prompt11|
        prompt11.say(message: "Please enter your security code. It's the 4 digits located on the front of your card.")
end
    pay.prompt(for: 'security-code', error_type: 'timeout', card_type: 'amex') do |prompt12|
        prompt12.say(message: "You didn't enter your credit card security code.  Please enter your security code. It's the 4 digits located on the front of your card.")
end
    pay.prompt(for: 'security-code', error_type: 'invalid-security-code', card_type: 'amex') do |prompt13|
        prompt13.say(message: 'That was an invalid security code. The security code must be 4 digits. Please try again.')
end
    pay.prompt(for: 'postal-code') do |prompt14|
        prompt14.say(message: 'Please enter your 5 digit billing zip code.')
end
    pay.prompt(for: 'postal-code', error_type: 'timeout') do |prompt15|
        prompt15.say(message: "You didn't enter your billing zip code. Please enter your 5 digit billing zip code.")
end
    pay.prompt(for: 'payment-processing') do |prompt16|
        prompt16.say(message: 'Thank you. Please wait while we process your payment.')
end
end

puts response
