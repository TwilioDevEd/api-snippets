require 'twilio-ruby'
require 'sinatra'

post '/voice' do
  twiml = Twilio::TwiML::Response.new do |r|
    if params['To']
      r.Dial callerId: '+15017122661' do |d|
        # wrap the phone number or client name in the appropriate TwiML verb
        # by checking if the number given has only digits and format symbols
        if params['To'].match?(/^[\d\+\-\(\) ]+$/)
          d.Number params['To']
        else
          d.Client params['To']
        end
      end
    else
      r.Say 'Thanks for calling!'
    end
  end

  content_type 'text/xml'
  twiml.text
end

# TODO: get '/token' do
