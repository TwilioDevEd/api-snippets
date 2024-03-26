require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.reject do |reject|
    reject.parameter(name: 'reject_reason', value: 'no agents available')
end

puts response
