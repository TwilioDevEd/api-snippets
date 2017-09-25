# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from flask import Flask
from twilio import twiml

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond to incoming calls with a simple text message."""

    resp = twiml.Response()
    msg = resp.message("Hello, Mobile Monkey")
    msg.media("https://demo.twilio.com/owl.png")

    return str(resp)

    if __name__ == "__main__":
        app.run(debug=True)
