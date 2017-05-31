# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# required for all twilio access tokens
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

client = Client(account_sid, auth_token)

newRatePlan = client.preview.wireless.rate_plans\
                    .create(unique_name='SmartMeterCA',
                            friendly_name='California SmartMeter Plan',
                            messaging_enabled=True)

print(newRatePlan)
