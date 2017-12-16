require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@caller_id = @client.api
                    .outgoing_caller_ids('PNe536d32a3c49700934481addd5ce1659')
                    .fetch

@caller_id.update(friendly_name: 'My Second Line')

puts @caller_id.friendly_name
