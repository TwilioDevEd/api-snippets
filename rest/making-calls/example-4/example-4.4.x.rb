# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

status_callback = %w[initiated ringing answered completed]
call = client.account.calls
             .create(url: 'http://demo.twilio.com/docs/voice.xml',
                     to: '+14155551212',
                     from: '+18668675309',
                     method: 'GET',
                     status_callback: 'https://www.myapp.com/events',
                     status_callback_method: 'POST',
                     status_callback_event: status_callback)
puts call.start_time
