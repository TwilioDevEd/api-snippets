# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
caller_id = client.account.outgoing_caller_ids
                  .get('PNe536d32a3c49700934481addd5ce1659')
                  .update(friendly_name: 'My Second Line')
puts caller_id.phone_number
