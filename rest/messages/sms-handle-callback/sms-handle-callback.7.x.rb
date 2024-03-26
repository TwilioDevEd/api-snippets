require 'sinatra'

# Handle message status hook,
# which is called whenever the message status changes
post '/message-status' do
  message_sid = params['MessageSid']
  message_status = params['MessageStatus']

  print "SID: #{message_sid}, Status: #{message_status}\n"

  response.status = 204
end
