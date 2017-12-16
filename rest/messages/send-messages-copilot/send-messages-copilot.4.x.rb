require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '[AuthToken]'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

body = 'Phantom Menace was clearly the best of the prequel trilogy.'
client.account.messages
      .create(messaging_service_sid: 'MG9752274e9e519418a7406176694466fa',
              to: '+441632960675',
              body: body)
