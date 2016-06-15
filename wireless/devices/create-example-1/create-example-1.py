# Download the **Next-Gen** twilio-python library from:
# twilio.com/docs/libraries/python#installation-nextgen
from twilio.rest import Client

account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # Your Account SID from www.twilio.com/console
auth_token  = "your_auth_token"  # Your Auth Token from www.twilio.com/console

client = Client(account_sid, auth_token)
wireless = client.preview.wireless

d = wireless.devices.create(
    alias='996224413905003',
    friendly_name="Charlie's SmartMeter",
    rate_plan='{{ rate_plan_sid }}'
  )

print(d.friendly_name)
