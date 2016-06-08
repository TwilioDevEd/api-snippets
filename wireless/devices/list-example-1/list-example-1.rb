# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.preview.wireless.devices.list().each do |device|
  puts device.friendly_name
end