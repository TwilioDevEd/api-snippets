# Download the Python helper library from twilio.com/docs/python/install
import json
from urllib.request import urlopen

from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = = 'SKXXXX'
api_key_secret = 'your_api_key_secret'
client = Client(api_key_sid, api_key_secret)

composition_sid = 'CXXXX'
uri = 'https://video.twilio.com/v1/Compositions/{}/Media?Ttl=6000'.format(composition_sid)
response = client.request('GET', uri)
media_location = json.loads(response.text).get('redirect_to')

# For example, get the data and download the media to a local file
data = urlopen(media_location).read()
local_file = 'myFile.mp4'
with open (local_file, 'wb') as f:
    f.write(data)

