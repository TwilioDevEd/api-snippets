require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.pay do |pay|
  pay.prompt(for: 'expiration-date', attempt: '1') do |prompt|
    prompt
      .say(message: 'Please enter your expiration date, two digits for the month and two digits for the year.')
  end
  pay.prompt(for: 'expiration-date', attempt: '2 3') do |prompt2|
    prompt2
      .say(message: 'Please enter your expiration date, two digits for the month and two digits for the year. For example, if your expiration date is March 2022, then please enter 0 3 2 2')
  end
end

puts response
