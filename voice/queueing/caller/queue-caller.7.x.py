# Download the Python helper library from twilio.com/docs/python/install
from twilio.twiml.voice_response import VoiceResponse

r = VoiceResponse()
r.enqueue("Queue Demo")
print(str(r))
