# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'sinatra'

post '/confirm' do
  # Get your Account Sid and Auth Token from https://www.twilio.com/console
  account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  auth_token = 'your_auth_token'

  # Initialize Twilio Client
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

  @client.account.messages(message_sid)
         .feedback.create(outcome: 'confirmed')

  redirect '/thanks'
end
