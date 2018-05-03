from flask import Flask, Response, request
import twilio.twiml

app = Flask(__name__)


@app.route("/voice", methods=['POST'])
def get_voice_twiml():
    """Respond to incoming calls with a simple text message."""

    resp = twilio.twiml.Response()
    if "To" in request.form:
        resp.dial(callerId="+15017122661").number(request.form["To"])
    else:
        resp.say("Thanks for calling!")

    return Response(str(resp), mimetype='text/xml')


if __name__ == "__main__":
    app.run(debug=True)
