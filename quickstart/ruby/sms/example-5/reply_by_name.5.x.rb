# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

get '/sms-quickstart' do
  sender = params[:From]
  friends = {
    '+14153334444' => 'Curious George',
    '+14158157775' => 'Boots',
    '+14155551234' => 'Virgil'
  }
  name = friends[sender] || 'Monkey'

  twiml = Twilio::TwiML::MessaingResponse.new do |r|
    r.message(body: "#{name}, thanks for the message!")
  end

  twiml.to_s
end
