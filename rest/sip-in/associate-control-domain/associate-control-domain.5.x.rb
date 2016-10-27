# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new account_sid, auth_token

@domain_sip = 'SD32a3c49700934481addd5ce1659f04d2'
@new_map = { ip_access_control_list_sid: 'AL32a3c49700934481addd5ce1659f04d2' }

# Create new ip access control list mapping
@ip_access_control_list_mapping = @client.account
                                         .sip.domains(@domain_sip)
                                         .ip_access_control_list_mappings
                                         .create(@new_map)

# Print ip access control list mapping friendly name
puts @ip_access_control_list_mapping.friendly_name
