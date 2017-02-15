from flask import Flask
from twilio import twiml

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def voice():
    """Respond to incoming calls with a simple text message."""

    resp = twiml.Response()
    resp.say("Hello. It's me.")
    resp.play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3")
    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
