# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
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
    .create(unique_name="MyFirstDocument", data=data)

print(document.sid)
