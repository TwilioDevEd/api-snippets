# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

number = @client.lookups.v1
                .phone_numbers('+16502530000') \
                .fetch(add_ons: 'payfone_tcpa_compliance',
                       add_ons_data: {
                         'payfone_tcpa_compliance.RightPartyContactedDate' => '20160101'
                       })

print(number.add_ons)
