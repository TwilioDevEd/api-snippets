# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# start_time param must be of Date type
@start_time = Time.new('2009-07-06')

# Get all calls for given account which have the status of completed and given
# start time and print the call direction
@client.calls.list(status: 'completed', start_time: @start_time)
       .each do |call|
         puts call.direction
       end
