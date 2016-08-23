# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{#accountSid}}{{accountSid}}{{/accountSid}}'
auth_token = '{{#authToken}}{{authToken}}{{/authToken}}'
@client = Twilio::REST::Client.new account_sid, auth_token

call = @client.account.calls.create(:url => "{{#voiceCallUrl}}{{voiceCallUrl}}{{/voiceCallUrl}}",
    :to => "{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}",
    :from => "{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}")
puts call.to
