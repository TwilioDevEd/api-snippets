# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::Client.new(account_sid, auth_token)

sim = @client.preview.wireless
  .sims("DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
  .update(
    status: 'active',
    callbackUrl: 'https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter'
    callbackMethod: 'POST'
  )

puts sim
