require 'twilio-ruby'

# Initialize the client
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
ip_messaging_client = Twilio::REST::IpMessagingClient.new account_sid,
                                                          auth_token

# Retrieve the channel
channel = ip_messaging_client
          .services.get('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
          .channels.get('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
puts channel
