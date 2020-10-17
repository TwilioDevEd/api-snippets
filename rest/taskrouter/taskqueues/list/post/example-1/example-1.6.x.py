# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
workspace_sid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

client = Client(account_sid, auth_token)

taskqueue = client.taskrouter.workspaces(workspace_sid) \
    .task_queues.create(
        friendly_name='English',
        reservation_activity_sid='WAea296a56ebce4bfbff0e99abadf16934',
        assignment_activity_sid='WA21d51f4c72583766988f9860de3e130a',
        target_workers='languages HAS "english"')

print(taskqueue.friendly_name)
