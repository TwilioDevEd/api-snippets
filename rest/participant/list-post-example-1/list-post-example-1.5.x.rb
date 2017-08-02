require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@participant = @client.api.conferences('AgentConf12')
                          .participants
                          .create(
                            from: '+18180021216',
                            to: '+15624421212'
                          )

puts @participant.call_sid
