require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
    start.transcription(status_callback_url: 'https://example.com/your-callback-url', inbound_track_label: 'agent', outbound_track_label: 'customer')
end

puts response
