# Get twilio-ruby from twilio.com/docs/ruby/install
require 'date'
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over records and print out a property for each one
@client.account.usage.records.list(
  :category   => 'calls-inbound',
  :start_date => Date.new(2012, 9, 1),
  :end_date   => Date.new(2012, 9, 30)).each do |record|
    puts record.price
  end
