from flask import Flask
from twilio import twiml

app = Flask(__name__)


@app.route("/voice", methods=['GET', 'POST'])
def voice():
    """Respond to incoming phone calls with a 'Hello world' message"""
    # Start our TwiML response
    resp = twiml.Response()

    # Read a message aloud to the caller
    resp.say("hello world!", voice='alice')

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
