require 'rubygems'
require 'sinatra'

# Define a handler for when the fax is initially sent
post '/fax/sent' do
  # Let's manually build some TwiML. We can choose to receive the
  # fax with <Receive>, or reject with <Reject>.
  content_type 'text/xml'

  <<-TWIML
    <Response>
        <Receive action="/fax/received"/>
    </Response>'
    TWIML
end

# Define a handler for when the fax is finished sending to us - if successful,
# We will have a URL to the contents of the fax at this point
post '/fax/received' do
  # log the URL of the PDF received in the fax
  logger.info(params['MediaUrl'])

  # Respond with empty 200/OK to Twilio
  status 200
  body ''
end
