# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC3094732a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::MonitorClient.new account_sid, auth_token

@params = {
  resource_sid: "PN4aa51b930717ea83c91971b86d99018f"
}
@client.events.list(@params).each do |e|
  puts e.description
end
