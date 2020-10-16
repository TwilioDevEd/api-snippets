require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@params = {
  actor_sid: 'USd0afd67cddff4ec7cb0022771a203cb1',
  resource_sid: 'PN4aa51b930717ea83c91971b86d99018f'
}

@client.monitor.v1.events.list(@params).each do |e|
  puts e.description
end
