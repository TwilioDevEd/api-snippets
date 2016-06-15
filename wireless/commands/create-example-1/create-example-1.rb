# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.preview.wireless.commands.create(
  device: '524116518656369',
  command: 'wakeup',
  callback_url: 'https://devicemanager.mycompany.com/devices/524116518656369/commands'
)