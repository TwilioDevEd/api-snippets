# Get the Ruby helper library from https://twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from https://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
client = Twilio::REST::Client.new account_sid, auth_token

body = 'Reply to this message to chat!'
message_interaction = client.proxy
                            .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                            .message_interactions.create(body: body)

puts message_interaction.sid
