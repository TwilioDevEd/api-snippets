require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

get '/voice/handle-gather' do
  redirect '/voice' unless %w[1 2].include?(params['Digits'])
  case params['Digits']
  when '1'
    response = Twilio::TwiML::Response.new do |r|
      r.Dial '+13105551212'
      r.Say 'The call failed or the remote party hung up. Goodbye.'
    end
  when '2'
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Record your message after the tone.'
      r.Record maxLength: '30', action: '/voice/handle-record', method: 'get'
    end
  end
  response.text
end
