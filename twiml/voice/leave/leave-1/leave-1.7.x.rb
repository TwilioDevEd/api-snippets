require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.enqueue(wait_url: 'wait.xml', name: 'support')
response
  .say(message: 'Unfortunately, the support line has closed. Please call again tomorrow.')

puts response
