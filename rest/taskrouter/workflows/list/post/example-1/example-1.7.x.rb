# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
workspace_sid = 'WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

client = Twilio::REST::Client.new(account_sid, auth_token)

sales_queue_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
marketing_queue_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
support_queue_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
everyone_queue_sid = 'WQXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

config = {
  'task_routing': {
    'filters': [
      {
        'expression': "type=='sales'",
        'targets': [{ 'queue': sales_queue_sid }]
      },
      {
        'expression': "type=='marketing'",
        'targets': [{ 'queue': marketing_queue_sid }]
      },
      {
        'expression': "type=='support'",
        'targets': [{ 'queue': support_queue_sid }]
      }
    ],
    'default_filter': {
      'queue': everyone_queue_sid
    }
  }
}

json = config.to_json

workflow = client.taskrouter.v1
                 .workspaces(workspace_sid).workflows
                 .create(
                   friendly_name: 'Sales, Marketing, Support Workflow',
                   assignment_callback_url: 'http://example.com',
                   fallback_assignment_callback_url: 'http://example.2com',
                   task_reservation_timeout: '30',
                   configuration: json
                 )

puts workflow.friendly_name
