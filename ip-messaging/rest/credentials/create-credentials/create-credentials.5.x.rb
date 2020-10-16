require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the credential
# type: Indicates which push notifications service this credential is for
#       - either gcm or apn
# api_key: [GCM only] This is the "API key" for project from Google Developer
#          console for your GCM Service application credential
# certificate: [APN only] URL encoded representation of the certificate, e.g.
# -----BEGIN CERTIFICATE-----MIITBAgIIAjy9H849.....A==-----END CERTIFICATE-----
credential = client.chat.v2
                   .credentials.create(type: 'gcm', api_key: 'gcm api key')
puts credential
