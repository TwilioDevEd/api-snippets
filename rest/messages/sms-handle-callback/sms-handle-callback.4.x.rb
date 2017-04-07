require 'sinatra'

post '/MessageStatus' do
  messageSid = params['MessageSid']
  messageStatus = params['MessageStatus']

  print "SID: " + messageSid + ", Status: " + messageStatus + "\n"

  response.status = 204
end
