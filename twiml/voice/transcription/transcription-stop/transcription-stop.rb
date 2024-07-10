require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.stop do |stop|
    stop.transcription(name: 'Contact center transcription')
end

puts response
