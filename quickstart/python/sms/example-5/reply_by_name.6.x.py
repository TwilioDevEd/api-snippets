# /usr/bin/env python
# Download the twilio-python library from twilio.com/docs/libraries/python
from flask import Flask, request
from twilio.twiml.messaging_response import MessagingResponse

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def hello_monkey():
    """Respond and greet the caller by name."""
    # Try adding your own number to this list!
    callers = {
        "+14158675308": "Curious George",
        "+12349013030": "Boots",
        "+12348134522": "Virgil",
    }
    from_number = request.values.get('From', None)
    message = callers[from_number] if from_number in callers else "Monkey"

    resp = MessagingResponse()
    resp.message("{}, thanks for the message!".format(message))

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
