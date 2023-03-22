# Download the Python helper library from twilio.com/docs/python/install
from twilio.twiml.voice_response import VoiceResponse, Dial

r = VoiceResponse()
r.say("You will now be connected to the first caller in the queue.")
d = Dial()
d.queue("Queue Demo")
r.append(d)
r.redirect('http://example.org')
print(str(r))
