# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
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
