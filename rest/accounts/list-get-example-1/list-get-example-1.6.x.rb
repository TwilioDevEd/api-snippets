# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over accounts and print out a property for each one
@client.api.accounts.list.each do |account|
  puts account.date_created
end
