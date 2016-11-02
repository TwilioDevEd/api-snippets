# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::Client.new(account_sid, auth_token)

device = @client.preview.wireless
  .devices('DEd3f4ec6c85ded1a5f64f10afc067895c').fetch

puts device.friendly_name
