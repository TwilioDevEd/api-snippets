from __future__ import with_statement  # Only necessary for Python 2.5
from flask import Flask
import twilio.twiml

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def voice():

    resp = twilio.twiml.Response()
    # Greet the caller by name
    resp.say("Hello. It's me. ")
    # Play an mp3
    resp.play("http://howtodocs.s3.amazonaws.com/ahoyhoy.mp3")

    # Gather digits.
    with resp.gather(numDigits=1, action="/handle-gather", method="POST") as g:
        g.say(
            """To speak to a realpreson, press 1.
                 Press 2 to record a message for a Twilio educator.
                 Press any other key to start over."""
        )

    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
