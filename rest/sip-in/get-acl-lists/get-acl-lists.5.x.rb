require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all acl's an print their friendly names
@client.account.sip.ip_access_control_lists.list
       .each do |ip_access_control_list|
         puts ip_access_control_list.friendly_name
       end
