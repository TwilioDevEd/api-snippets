# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token

plan = @client.preview.wireless.rate_plans(
  'us-automotive').fetch()

puts plan.sid
puts plan.alias_