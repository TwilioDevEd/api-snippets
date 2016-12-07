require "http"
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

#create role
service = ip_messaging_client.services.get('SERVICE_SID')
options = {:FriendlyName => 'friendlyName', :Type => 'deployment', :Permission => 'createChannel', :Permission => 'joinChannel'}
role = service.roles.create(options)
puts role
