# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a new app for the account with the given sid
app = @client.api.v2010.accounts(account_sid).applications.create(
  friendly_name: 'Phone Me',
  voice_url: 'http://demo.twilio.com/docs/voice.xml',
  voice_method: 'GET'
)

# Print the voice_url for the new app
puts app.voice_url
