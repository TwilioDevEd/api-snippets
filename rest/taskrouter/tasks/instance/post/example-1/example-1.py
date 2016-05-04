# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
task_sid = "{{ task_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

# update a task's attributes
task = client.tasks(workspace_sid).update(task_sid, attributes='{"type":"support"}')
print task.attributes

# alternatively
task = client.tasks(workspace_sid).get(task_sid)
task = task.update(attributes='{"type":"support"}')
print task.attributes

# cancel a task
task = client.tasks(workspace_sid).update(task_sid, assignment_status='canceled', reason='waiting too long')
print task.assignment_status
print task.reason

