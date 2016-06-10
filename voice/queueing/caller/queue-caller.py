# Download the Python helper library from twilio.com/docs/python/install
from twilio import twiml

r = twiml.Response()
r.enqueue("Queue Demo")
print(str(r))
