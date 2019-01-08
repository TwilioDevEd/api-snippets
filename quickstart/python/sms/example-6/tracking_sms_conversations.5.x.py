# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from flask import Flask, request, session
from twilio import twiml

# The session object makes use of a secret key.
SECRET_KEY = 'a secret key'
app = Flask(__name__)
app.config.from_object(__name__)

# Try adding your own number to this list!
callers = {
    "+14158675308": "Curious George",
    "+12349013030": "Boots",
    "+12348134522": "Virgil",
}

@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond with the number of text messages sent between two parties."""

    counter = session.get('counter', 0)

    # increment the counter
    counter += 1

    # Save the new counter value in the session
    session['counter'] = counter

    to_number = request.values.get('To')
    from_number = request.values.get('From', None)
    name = callers[from_number] if from_number in callers else "Monkey"

    message = "{} has messaged {} {} times".format(name, to_number, counter)

    resp = twiml.Response()
    resp.message(message)

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
