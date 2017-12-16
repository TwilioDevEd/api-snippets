require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new account_sid,
                                                          auth_token

# Delete a role
response = ip_messaging_client
           .services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
           .roles.get('RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
           .delete
puts response
