from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

client = Client(account_sid, auth_token)

fax = client.fax.v1
    .faxes(sid="FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
    .update(status="canceled")

print(fax.status)
