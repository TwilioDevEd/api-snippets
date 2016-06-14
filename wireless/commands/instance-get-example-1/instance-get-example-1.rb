# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token
cmd = @client.preview.wireless.commands('DCcb6aa7c620874dd98ba6c9c4108d0ed0').fetch()

puts cmd.command