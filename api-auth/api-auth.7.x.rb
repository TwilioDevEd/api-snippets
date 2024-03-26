require 'twilio-ruby'

# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']  # Your Account SID from www.twilio.com/console
api_key = ENV['TWILIO_API_KEY']  # You can generate this from www.twilio.com/console/runtime/api-keys/create
api_secret = ENV['TWILIO_API_KEY_SECRET']  # You can generate this from www.twilio.com/console/runtime/api-keys/create

# DANGER! This is insecure. See http://twil.io/secure
@client = Twilio::REST::Client.new api_key, api_secret, account_sid

# Proof request to check credentials are working.
# Retrieving your account information
accounts = @client.api.accounts.list

accounts.each do |record|
  puts record.sid
end
