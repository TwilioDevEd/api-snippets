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

recording_sid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
uri = "https://video.twilio.com/v1/Recordings/{}/Media".format(recording_sid)
response = client.request("GET", uri)
media_location = json.loads(response.text).get("redirect_to")

media_content = urlopen(media_location).read()
print(media_content)
