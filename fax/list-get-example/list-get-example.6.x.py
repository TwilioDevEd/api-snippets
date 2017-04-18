from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

faxes = client.fax.v1.faxes.list()

for fax in faxes:
    print(fax.media_url)
