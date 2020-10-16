require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over participants and print out a property for each one
@client.api.conferences('CFbbe4632a3c49700934481addd5ce1659')
       .participants.list.each do |participant|
         puts participant.muted
       end
