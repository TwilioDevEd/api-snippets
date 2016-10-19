# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# sid for known authorized connect app
connect_app_sid = 'CN47260e643654388faabe8aaa18ea6756'

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@authorized_app = @client.api.v2010.accounts(account_sid)
                         .authorized_connect_apps(connect_app_sid).fetch

# Print connect_app_homepage_url for selected authorized app
puts @authorized_app.connect_app_homepage_url
