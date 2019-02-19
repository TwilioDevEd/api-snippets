# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# required for all twilio access tokens
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Client(account_sid, auth_token)

ratePlanDeleted = client.wireless \
    .rate_plans('WPAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA') \
    .delete()

print(ratePlanDeleted)
