# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new account_sid,
                                            auth_token,
                                            workspace_sid

client.workspace.tasks
      .list(TaskQueueSid: 'WQf855e98ad280d0a0a325628e24ca9627').each do |task|
  puts task.attributes
end

client.workspace.tasks.list(AssignmentStatus: 'pending').each do |task|
  puts task.attributes
end
