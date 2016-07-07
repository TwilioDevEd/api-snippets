require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the service
service = client.preview.sync.services('SERVICE_SID')
puts response