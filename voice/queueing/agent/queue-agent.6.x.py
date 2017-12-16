# Download the Python helper library from twilio.com/docs/python/install
from twilio.twiml.voice_response import VoiceResponse, Dial

r = VoiceResponse()
d = Dial()
d.queue("Queue Demo")
r.append(d)

print(str(r))
