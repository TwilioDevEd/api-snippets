# NOTE: This example uses the next generation Twilio helper library - for more
# information on how to download and install this version, visit
# https://www.twilio.com/docs/libraries/python
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account = "{{ account_sid }}"
token = "{{ auth_token }}"
client = Client(account, token)

service = client.notifications.v1.services("ISxxx")

start_date = datetime.strptime("2015-08-25","%Y-%m-%d")
bindings = service.bindings.list(tag="premium", start_date=start_date)

print(bindings)