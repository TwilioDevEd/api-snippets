# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'sinatra'

enable :sessions

get '/sms-quickstart' do
  session['counter'] ||= 0
  counter = session['counter']

  from_number = params[:From]
  to_number = params[:To]
  friends = {
    '+14153334444' => 'Curious George',
    '+14158157775' => 'Boots',
    '+14155551234' => 'Virgil'
  }
  name = friends[from_number] || 'Monkey'

  message = "#{name} has messaged #{to_number} #{counter} times"

  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end

  session['counter'] += 1
  twiml.text
end
