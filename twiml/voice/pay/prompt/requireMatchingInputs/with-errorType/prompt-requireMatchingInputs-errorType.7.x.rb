require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay(payment_method: 'ach-debit', charge_amount: '13.22') do |pay|
    pay.prompt(for: 'bank-account-number') do |prompt|
        prompt.say(message: 'Thanks for using our service. Please enter your bank account number.')
end
    pay.prompt(for: 'bank-account-number', require_matching_inputs: true) do |prompt2|
        prompt2.say(message: 'Thank you. Please enter your bank account number again.')
end
    pay.prompt(for: 'bank-account-number', error_type: 'input-matching-failed') do |prompt3|
        prompt3.say(message: 'Sorry, your two bank account number inputs did not match. Please enter your bank account number again. We will then ask a second time again.')
end
end

puts response
