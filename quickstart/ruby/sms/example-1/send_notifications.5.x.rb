# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = '23d7b2c6345ff4626faa029c56e13dea'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+18316618357' # Your Twilio number
to = '+5511991016261' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend! Its a test, smile"
)
