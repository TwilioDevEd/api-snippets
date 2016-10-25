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

  # return the session count for each sms received
  message = if sms_count.zero?
              'Hello, thanks for the new message.'
            else
              'Hello, thanks for message number #{sms_count + 1}'
            end

  # Create a TwiML response and set the message content
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end

  # Increase session count
  session['counter'] += 1

  # Set the content type
  content_type 'text/xml'

  # Return the twiml xml string
  twiml.text
end
