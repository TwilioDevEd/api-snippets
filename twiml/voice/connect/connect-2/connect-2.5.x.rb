require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.connect do |connect|
    connect.room('DailyStandup', participant_identity: 'alice')
end

puts response
