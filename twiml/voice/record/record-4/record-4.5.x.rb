require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.record transcribe: true, transcribe_callback: '/handle_transcribe.php'

puts response
