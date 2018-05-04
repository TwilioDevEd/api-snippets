# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

call = @client.account.calls.create(
  url: 'http://demo.twilio.com/docs/voice.xml',
  to: '+14155551212',
  from: '+18668675310',
  method: 'GET',
  status_callback: 'https://www.myapp.com/events',
  status_callback_method: 'POST',
  status_callback_event: %w[initiated ringing answered completed]
)
puts call.start_time
