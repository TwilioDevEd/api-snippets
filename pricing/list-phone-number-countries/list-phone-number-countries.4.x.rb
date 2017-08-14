# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::PricingClient.new account_sid, auth_token

@countries = @client.phone_numbers.countries.list
@countries.each do |c|
  puts c.iso_country
end
