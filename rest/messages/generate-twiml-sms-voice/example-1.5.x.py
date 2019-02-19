from flask import Flask
from twilio import twiml

app = Flask(__name__)


@app.route("/voice", methods=['GET', 'POST'])
def voice():
    """Respond to incoming phone calls with a text message."""
    # Start our TwiML response
    resp = twiml.Response()

    # Read a message aloud to the caller
    resp.say("Hello! You will get an SMS message soon.")

    # Also tell Twilio to send a text message to the caller
    resp.sms("This is the ship that made the Kessel Run in fourteen parsecs?")

    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
