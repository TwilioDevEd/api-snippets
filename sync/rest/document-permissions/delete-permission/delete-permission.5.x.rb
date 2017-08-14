require('twilio-ruby')

accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
authToken = 'your_auth_token'

client = Twilio::REST::Client.new(accountSid, authToken)
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.documents('MyFirstDocument')
                    .document_permissions('bob').delete
  puts response
rescue Twilio::REST::TwilioError => err
  puts err
end
