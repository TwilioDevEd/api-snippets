require('twilio-ruby')

accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
authToken = 'your_auth_token'

client = Twilio::REST::Client.new(accountSid, authToken)
service = client.preview.sync.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.sync_maps('MPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    .sync_map_permissions.list
  puts response
rescue Twilio::REST::TwilioException => err
  puts err
end
