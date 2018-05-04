# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::MonitorClient.new(account_sid, auth_token)

@params = {
  actor_sid: 'USd0afd67cddff4ec7cb0022771a203cb1',
  resource_sid: 'PN4aa51b930717ea83c91971b86d99018f'
}
@client.events.list(@params).each do |e|
  puts e.description
end
