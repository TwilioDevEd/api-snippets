require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@ip_acl_list_map_sid = 'AL95a47094615fe05b7c17e62a7877836c'

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@ip_acl_list_map = @client.sip
                          .domains('SD32a3c49700934481addd5ce1659f04d2')
                          .ip_access_control_list_mappings(@ip_acl_list_map_sid)
                          .fetch

puts @ip_acl_list_map.friendly_name
