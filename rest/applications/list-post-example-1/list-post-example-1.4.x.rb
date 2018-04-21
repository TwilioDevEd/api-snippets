# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

app = @client.account.applications.create(friendly_name: 'Phone Me',
                                          voice_url: 'http://demo.twilio.com/docs/voice.xml',
                                          voice_method: 'GET')
puts app.voice_url
