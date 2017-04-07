from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

fax_sid = "FXaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

client = Client(account_sid, auth_token)

fax = client.fax.v1.faxes(sid=fax_sid).fetch()

print(fax.sid)
