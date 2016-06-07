# Download the **Next-Gen** twilio-python library from:
# twilio.com/docs/libraries/python#installation-nextgen
from twilio.rest import Client

account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # Your Account SID from www.twilio.com/console
auth_token  = "{{ auth_token }}"  # Your Auth Token from www.twilio.com/console

client = Client(account_sid, auth_token)
wireless = client.preview.wireless

usage = wireless.devices('DEb8eff34b248d066a31c4a953134e183e').usage().fetch()

print(usage.period['start'])
print(usage.period['end'])
print(usage.data_costs['total'])