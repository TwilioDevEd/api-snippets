# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Account Sid and Auth token for your new subaccount
# To set up environmental variables, see http://twil.io/secure
sub_account_sid = ENV['TWILIO_ACCOUNT_SID']
sub_auth_token = ENV['TWILIO_AUTH_TOKEN']
@sub_account_client = Twilio::REST::Client.new(sub_account_sid, sub_auth_token)
@subaccount = @sub_account_client.api.account

# Place to store the billable usage
time_to_bill = 0

# 30 days ago
start_time = Time.now - (30 * 24 * 60 * 60)

# Get all calls for the last 30 days
@subaccount.calls.list(start_time: start_time).each do |call|
  # Get time of call in minutes
  time_to_bill += (call.duration.to_f / 60).ceil
end

puts "Account #{sub_account_sid} used #{time_to_bill} minutes."
