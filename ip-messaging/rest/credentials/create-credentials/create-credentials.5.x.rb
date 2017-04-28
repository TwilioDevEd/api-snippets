require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACCOUNT_SID'
auth_token = 'AUTH_TOKEN'
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Create the credential
# type: Indicates which push notifications service this credential is for - either gcm or apn
# api_key: [GCM only] This is the "API key" for project from Google Developer console for your GCM Service application credential
# certificate: [APN only] URL encoded representation of the certificate, e.g. -----BEGIN CERTIFICATE-----MIIFnTCCBIWgAwIBAgIIAjy9H849+E8wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNV.....A==-----END CERTIFICATE-----
credential = @client.chat.v2.credentials.create(type: 'gcm', api_key: 'gcm api key')
puts credential
