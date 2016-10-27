# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# start_time param must be of Date type
@start_time = Date.iso8601('2009-07-06')

# Get all calls for given account which have the status of completed and given
# start time and print the call direction
@accounts.calls.list(status: 'completed', start_time: @start_time)
         .each do |call|
           puts call.direction
         end
