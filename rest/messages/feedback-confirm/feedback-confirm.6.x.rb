# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'sinatra'

post '/confirm' do
  # Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  # Initialize Twilio Client
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

  @client.messages(message_sid)
         .feedback.create(outcome: 'confirmed')

  redirect '/thanks'
end
