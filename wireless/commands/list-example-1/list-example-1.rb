# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.preview.wireless.commands.list().each do |cmd|
  puts cmd.command
end