# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

ip_acl_sid = 'AL32a3c49700934481addd5ce1659f04d2'
ip_acl_map = client.account.sip
                   .domains.get('SD32a3c49700934481addd5ce1659f04d2')
                   .ip_access_control_list_mappings
                   .create(ip_access_control_list_sid: ip_acl_sid)

puts ip_acl_map.friendly_name
