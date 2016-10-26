require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@acl_sid = 'AL32a3c49700934481addd5ce1659f04d2'

# Add a new ip address to acl with given sid
ip_address = @client.account.sip.ip_access_control_lists(@acl_sid)
                    .ip_addresses.create(
                      friendly_name: 'My office IP Address',
                      ip_address: '55.102.123.124'
                    )

# Print friendly name of new ip address
puts ip_address.friendly_name
