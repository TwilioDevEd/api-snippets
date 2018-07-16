require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response.enqueue(name: 'support', wait_url: 'wait.xml')
response
  .say(message: 'Unfortunately, the support line has closed. ' \
       'Please call again tomorrow.')

puts response
