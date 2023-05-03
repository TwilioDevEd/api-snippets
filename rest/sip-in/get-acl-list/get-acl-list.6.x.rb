require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@acl_list_sid = 'AL32a3c49700934481addd5ce1659f04d2'

@ip_acl_list = @client.sip
                      .ip_access_control_lists(@acl_list_sid)
                      .fetch

puts @ip_acl_list.friendly_name
