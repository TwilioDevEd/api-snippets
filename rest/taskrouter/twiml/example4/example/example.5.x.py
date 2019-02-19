# Download the Python helper library from twilio.com/docs/python/install
from flask import Flask
import twilio.twiml

app = Flask(__name__)


@app.route("/enqueue_call", methods=['GET', 'POST'])
def enqueue_call():
    resp = twilio.twiml.Response()
    with resp.enqueue(
        None,
        workflowSid="WW0123456789abcdef0123456789abcdef",
        waitUrl="/hold_music.php",
        action="/post_bridge_survey.php"
    ) as e:
        e.task('{"account_number":"12345abcdef"}')

    return str(resp)
