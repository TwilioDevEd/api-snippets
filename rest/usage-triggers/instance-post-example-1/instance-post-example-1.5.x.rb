# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
trigger = @client.usage.triggers('UT33c6aeeba34e48f38d6899ea5b765ad4').fetch
trigger.update(friendly_name: 'Monthly Maximum Call Usage',
               callback_url: 'https://www.example.com/monthly-usage-trigger')

puts trigger.date_fired
