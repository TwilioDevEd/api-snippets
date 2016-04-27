# Download the Python helper library from twilio.com/docs/python/install
from twilio.rest import TwilioRestClient

# Your Account Sid and Auth Token from twilio.com/user/account
account_sid = "{{ account_sid }}"
auth_token  = "{{ auth_token }}"
client = TwilioRestClient(account_sid, auth_token)

ip_access_control_list = client.sip.ip_access_control_lists.update("AL32a3c49700934481addd5ce1659f04d2", friendly_name="Avons Lieutenants")
print ip_access_control_list.friendly_name
