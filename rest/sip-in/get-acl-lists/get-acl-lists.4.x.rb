# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

# Loop over ip_access_control_lists and print out a property for each one
ip_acl_list = client.account.sip.ip_access_control_lists.list
ip_acl_list.each do |ip_access_control_list|
  puts ip_access_control_list.friendly_name
end
