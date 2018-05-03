# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'sinatra'
require 'twilio-ruby'

# Update with your own phone number in E.164 format
MODERATOR = '+15558675310'.freeze

post '/voice' do
  # Start our TwiML response
  Twilio::TwiML::Response.new do |r|
    # Start with a <Dial> verb
    r.Dial do |d|
      if params['From'] == MODERATOR
        # If the caller is our MODERATOR, then start the conference when they
        # join and end the conference when they leave
        d.Conference('My conference',
                     startConferenceOnEnter: true,
                     endConferenceOnExit: true)
      else
        # Otherwise have the caller join as a regular participant
        d.Conference 'My conference', startConferenceOnEnter: false
      end
    end
  end.text
end
