from flask import Flask
from twilio.util import TwilioCapability

app = Flask(__name__)

@app.route('/token', methods=['GET', 'POST'])
def client():
    """Respond to incoming requests."""

    # Find these values at twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    auth_token = "your_auth_token"

    capability = TwilioCapability(account_sid, auth_token)

    application_sid = "APXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" # Twilio Application Sid
    capability.allow_client_outgoing(application_sid)
    capability.allow_client_incoming("jenny")
    token = capability.generate()

    return token

if __name__ == "__main__":
    app.run(debug=True)