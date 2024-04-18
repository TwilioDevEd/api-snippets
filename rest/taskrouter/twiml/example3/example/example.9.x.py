# Download the Python helper library from twilio.com/docs/python/install
from flask import Flask
from twilio.twiml.voice_response import VoiceResponse

app = Flask(__name__)


@app.route("/enqueue_call", methods=['GET', 'POST'])
def enqueue_call():
    # workflow_sid = 'WW0123456789abcdef0123456789abcdef'

    resp = VoiceResponse()
    # TODO waiting for https://github.com/twilio/twilio-python/issues/283

    # with resp.enqueue(None, workflowSid=workflow_sid) as e:
    # e.task('{"account_number":"12345abcdef"}', priority = 5, timeout = 200)

    return str(resp)
