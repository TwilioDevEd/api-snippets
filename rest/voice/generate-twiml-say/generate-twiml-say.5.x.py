from flask import Flask
import twilio.twiml

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond to incoming calls with a simple text message."""

    resp = twilio.twiml.Response()
    resp.say("Hello from your pals at Twilio! Have fun.")
    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
