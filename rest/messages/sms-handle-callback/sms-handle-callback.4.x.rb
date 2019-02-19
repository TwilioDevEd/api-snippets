require 'sinatra'

post '/MessageStatus' do
  message_sid = params['MessageSid']
  message_status = params['MessageStatus']

  print 'SID: ' + message_sid + ', Status: ' + message_status + "\n"

  response.status = 204
end
