# Download the Python helper library from twilio.com/docs/python/install
import os
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

# A list of media objects with the properties described above
medias = client.messages('MM800f449d0399ed014aae2bcc0cc2f2ec') \
               .media \
               .list()

for media in medias:
    print(media.content_type)
