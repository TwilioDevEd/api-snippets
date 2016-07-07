require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Delete the service
service = client.preview.sync.services('SERVICE_SID')
response = service.update(friendly_name: 'NEW_FRIENDLY_NAME')
puts response.friendly_name