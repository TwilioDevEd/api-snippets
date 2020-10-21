# Get twilio-ruby from twilio.com/docs/ruby/install
require 'date'
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over records and print out a property for each one
@client.usage.records.daily.list(
  category: 'calls-inbound',
  start_date: Date.new(2012, 9, 1),
  end_date: Date.new(2012, 9, 30)
).each do |record|
  puts record.price
end
