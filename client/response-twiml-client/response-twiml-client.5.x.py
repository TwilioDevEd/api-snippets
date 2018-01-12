from flask import Flask, Response, request
import twilio.twiml
import re

phone_pattern = re.compile(r"^[\d\+\-\(\) ]+$")

app = Flask(__name__)


@app.route("/voice", methods=['POST'])
def get_voice_twiml():
    """Respond to incoming calls with a simple text message."""

    resp = twilio.twiml.Response()
    if "To" in request.form:
        dial = resp.dial(callerId="+15017122661")
        # wrap the phone number or client name in the appropriate TwiML verb
        # by checking if the number given has only digits and format symbols
        if phone_pattern.match(request.form["To"]):
            dial.number(request.form["To"])
        else:
            dial.client(request.form["To"])
    else:
        resp.say("Thanks for calling!")

    return Response(str(resp), mimetype='text/xml')


if __name__ == "__main__":
    app.run(debug=True)
