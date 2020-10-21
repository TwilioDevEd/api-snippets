require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

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
