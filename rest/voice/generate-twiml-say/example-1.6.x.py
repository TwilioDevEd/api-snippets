from flask import Flask
from twilio import twiml

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond to incoming calls with a simple text message."""

    resp = twiml.Response()
    resp.say("""Hello. It's me. I've been wondering if after this guide you'd like to meet.""")
    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
