# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from flask import Flask, request
from twilio.twiml.messaging_response import VoiceResponse

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond and greet the caller by name."""
    # Try adding your own number to this list!
    callers = {
        "+14158675309": "Curious George",
        "+14158675310": "Boots",
        "+14158675311": "Virgil",
    }
    from_number = request.values.get('From', None)
    name = callers[from_number] if from_number in callers else "Monkey"

    resp = VoiceResponse()
    resp.say("Hello {}".format(name))
    resp.sms("{}, thanks for the call!".format(name))

    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
