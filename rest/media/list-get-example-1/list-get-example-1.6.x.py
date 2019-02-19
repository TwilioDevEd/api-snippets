# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

# A list of media objects with the properties described above
medias = client.messages('MM800f449d0399ed014aae2bcc0cc2f2ec') \
               .media \
               .list()

for media in medias:
    print(media.content_type)
