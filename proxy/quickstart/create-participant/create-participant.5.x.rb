require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
client = Twilio::REST::Client.new account_sid, auth_token

participant = client.preview.proxy
    .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .participants.create(
        identifier: '+15558675309',
        friendly_name: 'Alice')

puts participant.sid
