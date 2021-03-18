# Download the helper library from https://www.twilio.com/docs/python/install
import os
from twilio.rest import Client


# Your Account Sid and Auth Token from twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

recording_rules = client.video \
                        .rooms('RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                        .recording_rules \
                        .update(rules=[{"type": "exclude", "all": true}])

print(recording_rules.room_sid)
