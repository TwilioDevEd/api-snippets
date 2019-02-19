# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from flask import Flask
from twilio.twiml.messaging_response import MessagingResponse, Message

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond to incoming calls with a simple text message."""

    resp = MessagingResponse()
    msg = Message()\
        .body("Hello, Mobile Monkey")\
        .media("https://demo.twilio.com/owl.png")
    resp.append(msg)

    return str(resp)

    if __name__ == "__main__":
        app.run(debug=True)
