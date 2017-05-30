# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# required for all twilio access tokens
account_sid = 'ACxxxxxxxxxxxx'
api_secret = 'xxxxxxxxxxxxxx'

client = Client(account_sid, auth_token)

newRatePlan = client.preview.wireless.ratePlans\
                    .create(uniqueName='SmartMeterCA',
                            friendlyName='California SmartMeter Plan',
                            messagingEnabled=True)

print(newRatePlan)
