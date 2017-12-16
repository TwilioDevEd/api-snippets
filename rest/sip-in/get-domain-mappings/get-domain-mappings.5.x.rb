require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over ip_access_control_list_mappings and print out a property for each
@client.sip.domains('SD32a3c49700934481addd5ce1659f04d2')
       .ip_access_control_list_mappings
       .list.each do |ip_access_control_list_mapping|
         puts ip_access_control_list_mapping.friendly_name
       end
