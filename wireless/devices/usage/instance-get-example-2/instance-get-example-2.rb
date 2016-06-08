# Download the **Next-Gen** twilio-ruby library from:
# twilio.com/docs/libraries/ruby#installation-nextgen
require 'twilio-ruby'

account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'

@client = Twilio::REST::Client.new account_sid, auth_token

usage = @client.preview.wireless.devices(
  '524116518656369').usage.fetch(
	start: "2016-05-01",
	end_: "2016-05-31"
  )

puts usage.period['start']
puts usage.period['end']
puts usage.data_costs['total']