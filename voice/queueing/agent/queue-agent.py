# Download the Python helper library from twilio.com/docs/python/install
from twilio import twiml

r = twiml.Response()
with r.dial() as d:
    d.queue("Queue Demo")
print(str(r))
