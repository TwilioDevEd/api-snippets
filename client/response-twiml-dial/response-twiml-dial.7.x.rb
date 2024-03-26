require 'twilio-ruby'
require 'sinatra'

post '/voice' do
  twiml = Twilio::TwiML::Response.new do |r|
    if params['To']
      r.Dial callerId: '+15017122661' do |d|
        d.Number params['To']
      end
    else
      r.Say 'Thanks for calling!'
    end
  end

  content_type 'text/xml'
  twiml.text
end

# TODO: get '/token' do
