from __future__ import with_statement  # Only necessary for Python 2.5
from flask import Flask, request, redirect
import twilio.twiml

app = Flask(__name__)


@app.route("/handle-gather", methods=['GET', 'POST'])
def handle_gather():
    """Handle key press from a user."""

    digit_pressed = request.values.get('Digits', None)
    if digit_pressed == "1":
        resp = twilio.twiml.Response()
        # Dial (310) 555-1212 - connect that number to the incoming caller.
        resp.dial("+13105551212")
        # If the dial fails:
        resp.say("The call failed, or the remote party hung up. Goodbye.")

        return str(resp)

    elif digit_pressed == "2":
        resp = twilio.twiml.Response()
        resp.say("Record your message after the tone.")
        resp.record(maxLength="30", action="/handle-recording")
        return str(resp)

    # If the caller pressed anything but 1, redirect them to the homepage.
    else:
        return redirect("/")


if __name__ == "__main__":
    app.run(debug=True)
