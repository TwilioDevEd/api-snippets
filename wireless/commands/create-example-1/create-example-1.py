# Download the **Next-Gen** twilio-python library from:
# twilio.com/docs/libraries/python#installation-nextgen
from twilio.rest import Client

account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # Your Account SID from www.twilio.com/console
auth_token  = "your_auth_token"  # Your Auth Token from www.twilio.com/console

client = Client(account_sid, auth_token)
wireless = client.preview.wireless

wireless.commands.create(
    device='524116518656369',
    command='wakeup',
    callback_url='https://devicemanager.mycompany.com/devices/524116518656369/commands'
)