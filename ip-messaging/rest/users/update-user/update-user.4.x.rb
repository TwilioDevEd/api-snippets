
require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new account_sid,
                                                          auth_token

# Update the user
response = ip_messaging_client
           .services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
           .users.create(identity: 'IDENTITY')
           .update(role_sid: 'NEW_SID')
puts response
