from flask import Flask, Response
from twilio.jwt.client import ClientCapabilityToken

app = Flask(__name__)


@app.route('/token', methods=['GET'])
def get_capability_token():
    """Respond to incoming requests."""

    # Find these values at twilio.com/console
    account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    auth_token = 'your_auth_token'

    capability = ClientCapabilityToken(account_sid, auth_token)

    # Twilio Application Sid
    application_sid = 'APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    capability.allow_client_outgoing(application_sid)
    capability.allow_client_incoming('jenny')
    token = capability.generate()

    return Response(token, mimetype='application/jwt')


if __name__ == "__main__":
    app.run(debug=True)
