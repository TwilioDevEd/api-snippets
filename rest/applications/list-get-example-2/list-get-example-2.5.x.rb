# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all apps from server filtered by friendly_name
apps = @client.account.applications.list(friendly_name: 'MyApp')

# Loop over apps and print out the voice_url property for each one
apps.each do |app|
  puts app.voice_url
end
