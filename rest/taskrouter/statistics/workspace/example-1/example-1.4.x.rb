# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::TaskRouterClient.new account_sid,
                                            auth_token,
                                            workspace_sid

statistics = client.workspace.statistics
puts statistics.cumulative['avg_task_acceptance_time']
puts statistics.cumulative['tasks_created']
puts statistics.realtime['tasks_by_status']['pending']
puts statistics.realtime['tasks_by_status']['assigned']
