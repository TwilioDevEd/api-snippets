# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

@feedback = @client.api.calls('CAe03b7cd806070d1f32bdb7f1046a41c0')
                   .feedback.create(
                     quality_score: '3',
                     issue: 'imperfect-audio'
                   )

puts @feedback.date_created
