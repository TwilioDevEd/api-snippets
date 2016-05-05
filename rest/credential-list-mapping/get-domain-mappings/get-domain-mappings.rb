# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby' 

# Get your Account Sid and Auth Token from twilio.com/user/account 
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token


# Loop over ip_access_control_list_mappings and print out a property for each one
@client.account.sip.domains.get('SD32a3c49700934481addd5ce1659f04d2').ip_access_control_list_mappings.list.each do |ip_access_control_list_mapping|
    puts ip_access_control_list_mapping.friendly_name
end
