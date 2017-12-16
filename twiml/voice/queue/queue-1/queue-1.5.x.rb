require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial do |dial|
  dial.queue('support', url: 'about_to_connect.xml')
end

puts response
