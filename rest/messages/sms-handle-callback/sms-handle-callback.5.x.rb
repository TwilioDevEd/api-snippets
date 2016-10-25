require 'sinatra'

# Handle message status hook,
# which is called whenever the message status changes
post '/MessageStatus' do
  message_sid = params['MessageSid']
  message_status = params['MessageStatus']

  # print the message sid and status
  print 'SID: #{message_sid}, Status: #{message_status}\n'

  # server has succesfully recieved request
  response.status = 204
end
