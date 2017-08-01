require 'twilio-ruby'
require 'sinatra'
require 'dotenv'

# Load environment configuration
Dotenv.load

# Generate a token for use in our Video application
get '/' do
  identity = params[:identity] || 'identity'

  # Create an Access Token for Video usage
  token = Twilio::JWT::AccessToken.new ENV['TWILIO_ACCOUNT_SID'],
  ENV['TWILIO_API_KEY'], ENV['TWILIO_API_SECRET'], 3600, identity

  # Grant access to Video
  grant = Twilio::JWT::AccessToken::VideoGrant.new
  grant.room = params[:room]
  token.add_grant grant

  # Generate the token and send to client
   token.to_jwt
end
