# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::PricingClient.new account_sid, auth_token

@country = @client.voice.countries.get('EE')
@country.inbound_call_prices.each do |p|
  puts "#{p['number_type']} #{p['current_price']}"
end
