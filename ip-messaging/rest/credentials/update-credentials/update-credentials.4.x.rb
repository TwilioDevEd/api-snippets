require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Update the credential
credential = ip_messaging_client.credentials.get('CREDENTIAL_SID')
puts credential.update(sid:'NEW_SID')