# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

key = 'payfone_tcpa_compliance.RightPartyContactedDate'

number = @client.lookups.v1
                .phone_numbers('+16502530000')
                .fetch(add_ons: 'payfone_tcpa_compliance',
                       add_ons_data: { key => '20160101' })

print(number.add_ons)
