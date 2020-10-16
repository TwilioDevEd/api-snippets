require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@participant = @client.api
                      .conferences('CFbbe4632a3c49700934481addd5ce1659')
                      .participants('CA386025c9bf5d6052a1d1ea42b4d16662')
                      .fetch

@participant.update(muted: 'True')

puts @participant.muted
