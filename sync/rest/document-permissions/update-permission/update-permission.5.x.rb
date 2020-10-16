require('twilio-ruby')

# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

client = Twilio::REST::Client.new(account_sid, auth_token)
service = client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')

begin
  response = service.documents('MyFirstDocument')
                    .document_permissions('bob')
                    .update(read: true, write: true, manage: false)
  puts response
rescue Twilio::REST::TwilioError => err
  puts err
end
