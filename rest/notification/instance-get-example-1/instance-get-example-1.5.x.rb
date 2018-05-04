require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@notification = @client.api
                       .notifications('NO5a7a84730f529f0a76b3e30c01315d1a')
                       .fetch

puts @notification.message_text
