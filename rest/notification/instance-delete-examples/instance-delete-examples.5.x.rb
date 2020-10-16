require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@notification = @client.api
                       .notifications('NO5a7a84730f529f0a76b3e30c01315d1a')
                       .fetch

@notification.delete
