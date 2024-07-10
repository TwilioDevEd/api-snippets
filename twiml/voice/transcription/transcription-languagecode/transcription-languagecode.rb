require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.start do |start|
    start.transcription(status_callback_url: 'https://example.com/your-callback-url', language_code: 'es-MX')
end

puts response
