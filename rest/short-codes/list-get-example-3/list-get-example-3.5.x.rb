require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Loop over short_codes and print out a property for each one
@client.short_codes.list(
  short_code: '898'
).each do |short_code|
  puts short_code.sms_method
end
