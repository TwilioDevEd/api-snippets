# Download the Python helper library from twilio.com/docs/python/install
import os
import json
from urllib.request import urlopen

from twilio.rest import Client

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
client = Client(account_sid, auth_token)

recording_sid = 'KVXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
uri = 'https://media.twilio.com/v1/MediaRecordings/{}/Media?Ttl=3600'.format(recording_sid)
response = client.request('GET', uri)
media_location = json.loads(response.text).get('redirect_to')

# For example, get the data and download the media to a local file
local_file = 'myFile.mp4'
with open (local_file, 'wb') as f:
    f.write(urlopen(media_location).read())
