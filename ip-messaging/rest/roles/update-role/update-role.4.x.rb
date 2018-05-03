require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new account_sid,
                                                          auth_token

# Update a role
options = { Permission: 'leaveChannel' }
role = ip_messaging_client
       .services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
       .roles.get('RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
       .update(options)
puts role
