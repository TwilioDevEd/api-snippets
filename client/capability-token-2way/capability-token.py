from flask import Flask, Response, request
from twilio.util import TwilioCapability

app = Flask(__name__)

@app.route('/token', methods=['GET'])
def get_capability_token():
    """Respond to incoming requests."""

    # Find these values at twilio.com/console
    account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    auth_token = 'your_auth_token'

    capability = TwilioCapability(account_sid, auth_token)

    application_sid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' # Twilio Application Sid
    capability.allow_client_outgoing(application_sid)
    capability.allow_client_incoming(request.form["ClientName"])
    token = capability.generate()

    return Response(token, mimetype='application/jwt')


# @app.route("/voice", methods=['POST'])
# TODO: def get_voice_twiml():


if __name__ == "__main__":
    app.run(debug=True)