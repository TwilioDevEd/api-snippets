# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
workflow_sid = "{{ workflow_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

workflow = client.workflows(workspace_sid).update(workflow_sid,task_reservation_timout='20')
print workflow.task_reservation_timeout

# alternatively
workflow = client.workflows(workspace_sid).get(workflow_sid)
workflow = workflow.update(task_reservation_timeout='20')
print workflow.task_reservation_timeout