require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@params = {
  resource_sid: 'PN4aa51b930717ea83c91971b86d99018f'
}

@client.monitor.v1.events.list(@params).each do |e|
  puts e.description
end
