# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::MonitorClient.new(account_sid, auth_token)

# Loop over alerts and print out a property for each one
@client.alerts.list(start_date: '2015-04-01T00:00:00Z',
                    end_date: '2015-04-30T23:59:59Z',
                    log_level: 'warning').each do |alert|
  puts alert.alert_text
end
