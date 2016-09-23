# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"
client = Client(account_sid, auth_token)

short_code = client.short_codes("SC6b20cb705c1e8f00210049b20b70fce3") \
                   .update(sms_url="http://demo.twilio.com/docs/sms.xml")

print(short_code.short_code)
