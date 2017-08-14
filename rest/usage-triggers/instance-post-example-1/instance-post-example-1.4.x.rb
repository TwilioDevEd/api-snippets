# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new account_sid, auth_token

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@trigger = @client.account.usage.triggers.get('UT33c6aeeba34e48f38d6899ea5b765ad4')
@trigger.update(friendly_name: 'Monthly Maximum Call Usage',
                callback_url: 'https://www.example.com/monthly-usage-trigger')
puts @trigger.date_fired
