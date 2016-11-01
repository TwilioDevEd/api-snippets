# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Twilio::REST::Client.new account_sid, auth_token

# Retrieve a valid notification service
service = client.notify.v1.services('ISxxx')

start_date = Time.parse('2015-08-25')

bindings = service.bindings.list(tag: 'new user', start_date: start_date)

puts bindings
