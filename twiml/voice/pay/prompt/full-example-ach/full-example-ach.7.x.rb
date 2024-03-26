require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(timeout: '5', max_attempts: '3', payment_method: 'ach-debit', language: 'en-US') do |pay|
    pay.prompt(for: 'bank-routing-number') do |prompt|
        prompt.say(message: 'Please enter your bank routing number.')
end
    pay.prompt(for: 'bank-routing-number', error_type: 'timeout') do |prompt2|
        prompt2.say(message: "You didn't enter your routing number. Please enter your bank routing number.")
end
    pay.prompt(for: 'bank-routing-number', error_type: 'invalid-bank-routing-number') do |prompt3|
        prompt3.say(message: 'That was an invalid bank routing number. Please try again.')
end
    pay.prompt(for: 'bank-account-number') do |prompt4|
        prompt4.say(message: 'Please enter your bank account number.')
end
    pay.prompt(for: 'bank-account-number', error_type: 'timeout') do |prompt5|
        prompt5.say(message: "You didn't enter your bank account number. Please enter your bank account number.")
end
    pay.prompt(for: 'payment-processing') do |prompt6|
        prompt6.say(message: 'Thank you. Please wait while we process your payment.')
end
end

puts response
