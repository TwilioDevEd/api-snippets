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

# Generate a token for use in our Video application
get '/token' do
  # Create a random username for the client
  identity = Faker::Internet.user_name

  # Create an Access Token for Video usage
  token = Twilio::Util::AccessToken.new(
    ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_API_KEY'],
    ENV['TWILIO_API_SECRET'], 3600, identity
  )

  # Grant access to Twilio Video
  grant = Twilio::Util::AccessToken::VideoGrant.new
  grant.configuration_profile_sid = ENV['TWILIO_CONFIGURATION_SID']
  token.add_grant grant

  # Generate the token and send to client
  json identity: identity, token: token.to_jwt
end
