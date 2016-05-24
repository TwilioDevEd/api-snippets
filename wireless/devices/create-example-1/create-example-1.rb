# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token

device = @client.preview.wireless.devices.create(
  alias_: '996224413905003',
  friendly_name: "Charlie's SmartMeter",
  rate_plan: '{{ rate_plan_sid }}'
)

puts device.friendly_name