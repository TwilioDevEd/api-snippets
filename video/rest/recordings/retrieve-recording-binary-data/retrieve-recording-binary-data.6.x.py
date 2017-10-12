# Download the Python helper library from twilio.com/docs/python/install
import json
import urllib2

from twilio.rest import Client

# Your Account Sid and Auth Token from twilio.com/console
api_key_sid = "SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
api_key_secret = "your_api_key_secret"
client = Client(api_key_sid, api_key_secret)

recording_sid = "RTXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
uri = "https://video.twilio.com/v1/Recordings/{}/Media".format(recording_sid)
response = client.request("GET", uri)
media_location = json.loads(response.text).get("location")

media_content = urllib2.urlopen(media_location).read()
print(media_content)
