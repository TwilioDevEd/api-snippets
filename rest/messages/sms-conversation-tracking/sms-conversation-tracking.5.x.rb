require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           secret: 'can-be-anything-but-keep-a-secret'

# Return the session number for each sms received.
post '/sms' do
  session['counter'] ||= 0
  sms_count = session['counter']

  message = if sms_count.zero?
              'Hello, thanks for the new message.'
            else
              "Hello, thanks for message number #{sms_count + 1}"
            end

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message(body: message)
  end

  session['counter'] += 1

  content_type 'text/xml'

  twiml.to_s
end
