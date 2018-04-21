# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@app = @client.account.applications.get('AP2a0747eba6abf96b7e3c3ff0b4530f6e')
@app.update(voice_url: 'http://demo.twilio.com/docs/voice.xml',
            sms_url: 'http://demo.twilio.com/docs/sms.xml')
puts @app.voice_url
