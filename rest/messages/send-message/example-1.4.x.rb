require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

body = 'This is the ship that made the Kessel Run in fourteen parsecs?'
media_url = 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg'
client.account.messages.create(from: '+15017250604',
                               to: '+15558675309',
                               body: body,
                               media_url: media_url)
