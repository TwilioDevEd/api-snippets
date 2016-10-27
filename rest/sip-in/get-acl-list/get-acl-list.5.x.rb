require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@acl_list_sid = 'AL32a3c49700934481addd5ce1659f04d2'

# Get the ip access control list with the given sid
@ip_acl_list = @client.account.sip
                      .ip_access_control_lists(@acl_list_sid)
                      .fetch

# Print friendly for acl list
puts @ip_acl_list.friendly_name
