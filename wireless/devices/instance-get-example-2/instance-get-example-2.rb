# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token
device = @client.preview.wireless.devices('524116518656369').fetch()

puts device.friendly_name