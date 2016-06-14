# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token

plan = @client.preview.wireless.rate_plans(
  'WP467fb57a0aba9641a8209136d42545f8').fetch()

puts plan.sid
puts plan.alias_