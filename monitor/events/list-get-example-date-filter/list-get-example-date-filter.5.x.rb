require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@params = {
  start_date: Time.new('2015-03-01T00:00:00Z'),
  end_date: Time.new('2015-04-01T00:00:00Z')
}

@client.monitor.v1.events.list(@params).each do |e|
  puts e.description
end
