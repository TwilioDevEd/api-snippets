require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.enqueue('support', wait_url: 'wait.xml')
response
  .say('Unfortunately, the support line has closed. Please call again tomorrow.')

puts response
