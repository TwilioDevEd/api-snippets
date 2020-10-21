require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@caller_id = @client.api
                    .outgoing_caller_ids('PNe905d7e6b410746a0fb08c57e5a186f3')
                    .fetch

puts @caller_id.phone_number
