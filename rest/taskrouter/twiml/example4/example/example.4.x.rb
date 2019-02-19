# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
require 'sinatra'

set :port, 8080

post '/enqueue_call' do
  sid = 'WW0123456789abcdef0123456789abcdef'
  wait_url = '/hold_music.php'
  action = '/post_bridge_survey.php'
  attributes = '{"account_number":"12345abcdef"}'
  Twilio::TwiML::Response.new do |r|
    r.Enqueue workflow_sid: sid, wait_url: wait_url, action: action do |e|
      e.Task attributes
    end
  end.text
end
