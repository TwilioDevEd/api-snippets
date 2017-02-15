# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

@client = Twilio::REST::Client.new(account_sid, auth_token)

usage = @client.preview.wireless
  .devices('DEb8eff34b248d066a31c4a953134e183e').usage.fetch

puts usage.period['start']
puts usage.period['end']
puts usage.data_costs['total']
