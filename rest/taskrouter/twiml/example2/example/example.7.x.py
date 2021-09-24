# Download the Python helper library from twilio.com/docs/python/install
from flask import Flask
from twilio.twiml.voice_response import VoiceResponse, Enqueue

app = Flask(__name__)


@app.route("/enqueue_call", methods=['GET', 'POST'])
def enqueue_call():

    workflow_sid = 'WW0123456789abcdef0123456789abcdef'

    resp = VoiceResponse()

    e = Enqueue(None, workflowSid=workflow_sid)
    e.task('{"account_number":"12345abcdef"}')

    resp.append(e)

    return str(resp)
