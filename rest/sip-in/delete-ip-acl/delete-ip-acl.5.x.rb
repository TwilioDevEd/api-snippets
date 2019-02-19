require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@ip_acl_sid = 'AL32a3c49700934481addd5ce1659f04d2'

@ip_access_control_list = @client.sip
                                 .ip_access_control_lists(@ip_acl_sid)
                                 .fetch

@ip_access_control_list.delete
