require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(from: '+15017250604',
                                to: '+15558675309',
                                body: 'McAvoy or Stewart? These timelines can get so confusing.',
                                status_callback: 'http://requestb.in/1234abcd')
