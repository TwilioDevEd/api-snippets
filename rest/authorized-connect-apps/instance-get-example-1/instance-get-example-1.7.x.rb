# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

connect_app_sid = 'CN47260e643654388faabe8aaa18ea6756'

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@authorized_app = @client.api.authorized_connect_apps(connect_app_sid).fetch

puts @authorized_app.connect_app_homepage_url
