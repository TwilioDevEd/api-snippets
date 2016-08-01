from flask import Flask, request, redirect
import twilio.twiml

app = Flask(__name__)

@app.route("/", methods=['GET', 'POST'])
def incoming_sms():
    """Respond to incoming calls with a simple text message."""

    from twilio import twiml

    body = request.values.get('Body', None)

    r = twiml.Response()

    if body == 'hello':
        r.message("Hi!")
    elif body == 'bye':
        r.message("Goodbye")
    print str(r)

if __name__ == "__main__":
    app.run(debug=True)