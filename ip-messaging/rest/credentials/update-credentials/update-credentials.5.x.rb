require 'http'
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Update the credential
credential = @client.ip_messaging.v1.credentials('SID').fetch
puts credential.update(friendly_name: 'friendly_name')
