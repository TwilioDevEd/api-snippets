require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = '{{#accountSid}}{{accountSid}}{{/accountSid}}'
auth_token = '{{#authToken}}{{authToken}}{{/authToken}}'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '{{#fromPhoneNumber}}{{fromPhoneNumber}}{{/fromPhoneNumber}}',
  :to => '{{#toPhoneNumber}}{{toPhoneNumber}}{{/toPhoneNumber}}',
  :body => '{{#messageBody}}{{messageBody}}{{/messageBody}}',
  :media_url => '{{#messageMediaUrl}}{{messageMediaUrl}}{{/messageMediaUrl}}',
})
