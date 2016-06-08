# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = '{{ account_sid }}'
auth_token = '{{ auth_token }}'
workspace_sid = '{{ workspace_sid }}'

client = Twilio::REST::TaskRouterClient.new account_sid, auth_token, workspace_sid

taskqueue = client.workspace.taskqueues.create(friendly_name: 'English', reservation_activity_sid: 'WAxxxx', assignment_activity_sid: 'WAyyyy', target_workers: 'languages HAS "english"')
puts taskqueue.friendly_name