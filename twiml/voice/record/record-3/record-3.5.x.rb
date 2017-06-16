require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new 
response.say 'Please leave a message at the beep.\nPress the star key when finished.'
response.record action: 'http://foo.edu/handleRecording.php', method: 'GET', max_length: 20, finish_on_key: '*'
response.say 'I did not receive a recording'

puts response
