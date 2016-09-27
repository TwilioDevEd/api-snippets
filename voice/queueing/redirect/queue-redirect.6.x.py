# Download the Python helper library from twilio.com/docs/python/install
from twilio import twiml

r = twiml.Response()
r.say("You will now be connected to the first caller in the queue.")
with r.dial() as d:
    d.queue("Queue Demo")
r.redirect()
print(str(r))
