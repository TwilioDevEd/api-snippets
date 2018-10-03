# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

country = @client.pricing.v2.voice.countries('EE')
country.fetch.inbound_call_prices.each do |p|
  puts "#{p['number_type']} #{p['current_price']}"
end
