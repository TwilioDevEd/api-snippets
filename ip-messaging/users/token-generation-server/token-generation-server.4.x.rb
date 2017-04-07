require 'twilio-ruby'
require 'sinatra'
require 'sinatra/json'
require 'dotenv'
require 'faker'

# Load environment configuration
Dotenv.load

# Render home page
get '/' do
  File.read(File.join('public', 'index.html'))
end

# Generate a token for use in our IP Messaging application
get '/token' do
  # Get the user-provided ID for the connecting device
  device_id = params['device']

  # Create a random username for the client
  identity = Faker::Internet.user_name

  # Create a unique ID for the currently connecting device
  endpoint_id = "TwilioDemoApp:#{identity}:#{device_id}"

  # Create an Access Token for IP messaging usage
  token = Twilio::Util::AccessToken.new ENV['TWILIO_ACCOUNT_SID'],
    ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], 3600, identity

  # Create IP Messaging grant for our token
  grant = Twilio::Util::AccessToken::IpMessagingGrant.new
  grant.service_sid = ENV['TWILIO_IPM_SERVICE_SID']
  grant.endpoint_id = endpoint_id
  token.add_grant grant

  # Generate the token and send to client
  json :identity => identity, :token => token.to_jwt
end
