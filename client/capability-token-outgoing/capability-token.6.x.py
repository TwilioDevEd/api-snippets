import os
from flask import Flask, Response
from twilio.jwt.client import ClientCapabilityToken

app = Flask(__name__)


@app.route('/token', methods=['GET'])
def get_capability_token():
    """Respond to incoming requests."""

    # Find these values at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
    account_sid = os.environ['TWILIO_ACCOUNT_SID']
    auth_token = os.environ['TWILIO_AUTH_TOKEN']

    capability = ClientCapabilityToken(account_sid, auth_token)

    # Twilio Application Sid
    application_sid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    capability.allow_client_outgoing(application_sid)
    token = capability.to_jwt()

    return Response(token, mimetype='application/jwt')


if __name__ == "__main__":
    app.run(debug=True)
