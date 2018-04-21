# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
short_code = client.account.sms.short_codes
                   .get('SC6b20cb705c1e8f00210049b20b70fce3')
                   .update(sms_url: 'http://demo.twilio.com/docs/sms.xml')
puts short_code.short_code
