# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

begin
  number = @client.lookups.v1.phone_numbers('+15108675310').fetch(type: 'carrier')

  puts number.carrier['type']
  puts number.carrier['name']
rescue Twilio::REST::RestError => err
  if err.status_code === 404
    puts 'No carrier information'
  else
    puts err.message
  end
end
