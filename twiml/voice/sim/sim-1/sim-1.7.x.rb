require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.sim('DE8caa2afb9d5279926619c458dc7098a8')
end

puts response
