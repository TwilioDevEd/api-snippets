# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new account_sid, auth_token

service = client.notify.services('ISxxx')

start_date = Time.parse('2015-08-25')

bindings = service.bindings.list(tag: 'new user', start_date: start_date)

puts bindings
