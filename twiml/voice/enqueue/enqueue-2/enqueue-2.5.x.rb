require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
response
  .play(url: 'http://com.twilio.sounds.music.s3.amazonaws.com/MARKOVICHAMP-Borghestral.mp3')

puts response
