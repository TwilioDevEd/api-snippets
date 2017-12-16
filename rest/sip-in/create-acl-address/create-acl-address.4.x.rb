# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

ip_address = client.account.sip.ip_access_control_lists
                   .get('AL32a3c49700934481addd5ce1659f04d2')
                   .ip_addresses.create(friendly_name: 'My office IP Address',
                                        ip_address: '55.102.123.124')

puts ip_address.friendly_name
