require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get all notifications of a certain date and log level
@client.account.notifications.list(
  message_date: Time.new('2009-07-06'),
  log: '1'
).each do |notification|
  # Print the message text for each notification
  puts notification.message_text
end
