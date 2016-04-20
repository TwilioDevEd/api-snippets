# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "ACda6f132a3c49700934481addd5ce1659"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

client.feedback_summary.delete("FSa346467ca321c71dbd5e12f627deb854")
