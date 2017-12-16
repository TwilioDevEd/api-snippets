require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over recordings and print out a property for each one
@client.recordings.list(
  date_created_before: Time.new('2016-10-15'),
  date_created_after: Time.new('2016-10-12')
).each do |recording|
  puts recording.duration
end
