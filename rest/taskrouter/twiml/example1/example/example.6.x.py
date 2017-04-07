# Download the Python helper library from twilio.com/docs/python/install
from flask import Flask
from twilio.twiml.voice_response import VoiceResponse

app = Flask(__name__)


@app.route("/enqueue_call", methods=['GET', 'POST'])
def enqueue_call():
    resp = VoiceResponse()
    resp.enqueue(None, workflowSid="WW0123456789abcdef0123456789abcdef")

    return str(resp)
