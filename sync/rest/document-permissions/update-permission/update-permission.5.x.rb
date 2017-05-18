require('twilio-ruby')

accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
authToken = 'your_auth_token'

client = Twilio::REST::Client.new(accountSid, authToken)
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.documents('MyFirstDocument')
    .document_permissions('bob').update(read: true, write: true, manage: false)
  puts response
rescue Twilio::REST::TwilioException => err
  puts err
end
