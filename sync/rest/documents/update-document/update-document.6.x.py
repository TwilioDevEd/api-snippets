# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client
from datetime import datetime

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

new_data = {
    'date_updated': str(datetime.now()),
    'movie_title': "On The Line",
    'show_times': None,
    'starring': ["Lance Bass", "Joey Fatone"],
    'genre': "Romance"
}

document = client.sync \
    .services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") \
    .documents("MyFirstDocument") \
    .update(data=new_data)

print(document.data)
