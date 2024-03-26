require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@ip_acl_list_sid = 'AL32a3c49700934481addd5ce1659f04d2'

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@ip_address = @client.api.sip
                     .ip_access_control_lists(@ip_acl_list_sid)
                     .ip_addresses('IP32a3c49700934481addd5ce1659f04d2')
                     .fetch

@ip_address.update(friendly_name: 'Orlandos Nightclub')

puts @ip_address.friendly_name
