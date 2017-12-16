# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
worker_sid = 'WKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

worker = client.taskrouter.v1.workspaces(workspace_sid)
               .workers(worker_sid).fetch

worker = worker.update(attributes: '{"type":"support"}')

puts worker.attributes
