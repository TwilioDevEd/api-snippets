# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@member = @client.account.queues('QU5ef8732a3c49700934481addd5ce1659')
                 .members('CA386025c9bf5d6052a1d1ea42b4d16662').fetch

# Print the wait time for this queue
puts @member.wait_time
