require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@params = {
  start_date: Time.new('2015-03-01T00:00:00Z'),
  end_date: Time.new('2015-04-01T00:00:00Z')
}

@client.monitor.v1.events.list(@params).each do |e|
  puts e.description
end
