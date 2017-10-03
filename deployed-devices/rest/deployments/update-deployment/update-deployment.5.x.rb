# Get the Ruby helper library from https://twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from https://twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new(account_sid, auth_token)

deployment_sid = 'DLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
deployment = client.preview.deployed_devices
                   .deployments(deployment_sid)
                   .update(friendly_name: 'My New Device Deployment')

puts deployment.friendly_name
