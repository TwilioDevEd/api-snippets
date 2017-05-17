require('twilio-ruby')

accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
authToken = 'your_auth_token'

client = Twilio::REST::Client.new(accountSid, authToken)
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.documents('ETXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .document_permissions('bob').delete
  puts response
rescue Twilio::REST::TwilioException => err
  puts err
end
