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

    # Twilio Application Sid
    application_sid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    capability.allow_client_outgoing(application_sid)
    capability.allow_client_incoming(request.form["ClientName"])
    token = capability.generate()

    return Response(token, mimetype='application/jwt')


if __name__ == "__main__":
    app.run(debug=True)
