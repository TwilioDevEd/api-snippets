# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
transcription = client.api
                      .transcriptions('TR8c61027b709ffb038236612dc5af8723')
                      .fetch
puts transcription.transcription_text
