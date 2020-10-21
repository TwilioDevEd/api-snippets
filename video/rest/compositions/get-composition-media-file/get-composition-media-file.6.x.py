# Download the Python helper library from twilio.com/docs/python/install
import os
import json
from urllib.request import urlopen

from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = os.environ['TWILIO_API_KEY']
api_key_secret = os.environ['TWILIO_API_KEY_SECRET']
client = Client(api_key_sid, api_key_secret)

composition_sid = 'CXXXX'
uri = 'https://video.twilio.com/v1/Compositions/{}/Media?Ttl=3600'.format(composition_sid)
response = client.request('GET', uri)
media_location = json.loads(response.text).get('redirect_to')

# For example, get the data and download the media to a local file
local_file = 'myFile.mp4'
with open (local_file, 'wb') as f:
    f.write(urlopen(media_location).read())
