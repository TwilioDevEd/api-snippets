# Get twilio-ruby from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@phone_number_sids = %w[PN2a0747eba6abf96b7e3c3ff0b4530f6e
                        PN557ce644e5ab84fa21cc21112e22c485
                        PN2a0747eba6abf96b7e3c3ff0b4530f6e]

@phone_number_sids.each do |phone_number_sid|
  @phone_number = @client.messaging.v1
                         .services('MG2172dd2db502e20dd981ef0d67850e1a')
                         .phone_numbers
                         .create(phone_number_sid: phone_number_sid)

  puts @phone_number.sid
end
