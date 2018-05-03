require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.dial(action: 'handleLeaveConference.php', method: 'POST',
              hangup_on_star: true, time_limit: 30) do |dial|
  dial.conference('LoveTwilio')
end

puts response
