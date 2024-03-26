# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = 'yyyyyyyyyyyyyyyyyyyyyyyyy'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+15551234567' # Your Twilio number
to = '+15555555555' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)

