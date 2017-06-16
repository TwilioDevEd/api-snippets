require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
dial = Twilio::TwiML::Dial.new action: 'handleLeaveConference.php', method: 'POST', hangup_on_star: 'true', time_limit: 30
dial.conference 'LoveTwilio'
response.append dial

puts response
