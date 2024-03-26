require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
    dial.application(customer_id: 'CustomerFriendlyName') do |application|
        application.application_sid('AP1234567890abcdef1234567890abcd')
end
end

puts response
