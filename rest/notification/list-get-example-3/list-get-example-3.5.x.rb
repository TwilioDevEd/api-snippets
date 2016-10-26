require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all notifications sent after a certain date with log level of 1
@client.notifications.list(
  message_date_after: Time.new('2009-07-06'),
  log: '1'
).each do |notification|
  # Print the notification request url for each
  puts notification.request_url
end
