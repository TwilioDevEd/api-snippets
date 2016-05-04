# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioTaskRouterClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token  = "{{ auth_token }}"
workspace_sid = "{{ workspace_sid }}"
taskqueue_sid = "{{ taskqueue_sid }}"

client = TwilioTaskRouterClient(account_sid, auth_token)

taskqueue = client.taskqueues(workspace_sid).get(taskqueue_sid)
taskqueue.delete()