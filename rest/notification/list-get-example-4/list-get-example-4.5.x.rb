require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.notifications.list(
  message_date_after: Time.new('2009-07-06'),
  message_date_before: Time.new('2009-07-08'),
  log: '1'
).each do |notification|
  puts notification.request_url
end
