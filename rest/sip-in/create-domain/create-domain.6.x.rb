require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

domain = @client.sip.domains.create(
  friendly_name: 'My Domain',
  voice_url: 'https://demo.twilio.com/welcome',
  auth_type: 'IP_ACL',
  domain_name: 'marlo.sip.twilio.com'
)

puts domain.domain_name
