# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::MonitorClient.new account_sid, auth_token

@params = {
  source_ip_address: '104.14.155.29',
  start_date: '2015-04-25T00:00:00Z',
  end_date: '2015-04-25T23:59:59Z'
}
@client.events.list(@params).each do |e|
  puts e.description
end
