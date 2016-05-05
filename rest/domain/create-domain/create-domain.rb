# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token

domain = @client.account.sip.domains.create(:friendly_name => "Scranton Office",
    :voice_url => "https://dundermifflin.example.com/twilio/app.php",
    :auth_type => "IP_ACL",
    :domain_name => "dunder-mifflin-scranton.sip.twilio.com")
puts domain.domain_name
