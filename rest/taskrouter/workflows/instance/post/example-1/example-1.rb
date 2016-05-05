# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = '{{ auth_token }}'
workspace_sid = '{{ workspace_sid }}'
workflow_sid = '{{ workflow_sid }}'

client = Twilio::REST::TaskRouterClient.new account_sid, auth_token, workspace_sid

workflow = client.workspace.workflows.get(workflow_sid)
workflow = workflow.update(task_reservation_timeout: '20')
puts workflow.task_reservation_timeout