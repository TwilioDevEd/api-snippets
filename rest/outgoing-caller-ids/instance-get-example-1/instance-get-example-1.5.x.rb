require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an outgoing caller id with the given sid
@caller_id = @client.account
                    .outgoing_caller_ids('PNe905d7e6b410746a0fb08c57e5a186f3')
                    .fetch

# Print the caller id number
puts @caller_id.phone_number
