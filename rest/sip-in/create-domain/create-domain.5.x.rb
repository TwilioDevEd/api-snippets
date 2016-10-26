require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create a new sip domain
domain = @client.account.sip.domains.create(
  friendly_name: 'My Domain',
  voice_url: 'https://demo.twilio.com/welcome',
  auth_type: 'IP_ACL',
  domain_name: 'marlo.sip.twilio.com'
)

# Print new domain name
puts domain.domain_name
