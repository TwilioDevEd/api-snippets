# Get the Ruby helper library from https://twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from https://twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

fleet_sid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
fleet_service = client.preview.deployed_devices.fleets(fleet_sid)

key_sid = 'KYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
deleted = fleet_service.keys(key_sid).delete

puts deleted
