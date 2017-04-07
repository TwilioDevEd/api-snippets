require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over alerts and print out a property for each one
@client.monitor.v1.alerts.list(
  start_date: Time.parse('2015-04-01T00:00:00Z'),
  end_date: Time.parse('2015-04-30T23:59:59Z'),
  log_level: 'warning'
).each do |alert|
  puts alert.alert_text
end
