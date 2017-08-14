# NOTE: This example uses the ALPHA release of the next generation Twilio
# helper library - for more information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
client = Twilio::REST::Client.new account_sid, auth_token

message_interaction = client.preview
                            .proxy
                            .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .message_interactions.create(body: 'Reply to this message to chat!')

puts message_interaction.sid
