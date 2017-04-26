require 'twilio-ruby'

# Initialize the client
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
ip_messaging_client = Twilio::REST::IpMessagingClient.new(account_sid, auth_token)

# Update the user
service = ip_messaging_client.services.get('SERVICE_SID')
user = service.users.create(identity:'IDENTITY')
response = user.update(role_sid: 'NEW_SID')
puts response
