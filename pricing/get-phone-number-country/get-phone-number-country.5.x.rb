# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

country = @client.pricing.phone_numbers.countries('US')
country.fetch.phone_number_prices.each do |p|
  puts "#{p['number_type']} #{p['current_price']}"
end
