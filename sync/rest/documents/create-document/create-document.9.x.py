# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

data = {
    'date_updated': str(datetime.now()),
    'movie_title': "On The Line",
    'show_times': ["12:30:00Z", "14:45:00Z", "15:30:00Z", "17:45:00Z"],
    'starring': ["Lance Bass", "Joey Fatone"],
    'genre': "Romance"
}

document = client.sync \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .documents \
    .create(unique_name="MyFirstDocument",
            data=data,
            ttl=1814400)  # expires in 21 days

print(document.sid)
