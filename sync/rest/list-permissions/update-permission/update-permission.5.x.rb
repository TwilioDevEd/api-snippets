require('twilio-ruby')

accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
authToken = 'your_auth_token'

client = Twilio::REST::Client.new(accountSid, authToken)
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.sync_lists('MyFirstList')
                    .sync_list_permissions('bob').update(read: true, write: true, manage: true)
  puts response
rescue Twilio::REST::TwilioError => err
  puts err
end
