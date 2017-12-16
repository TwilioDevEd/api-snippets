from flask import Flask
from requests.auth import HTTPBasicAuth

import logging
import requests

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

# Get your Account Sid and Auth Token from twilio.com/console
ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "your_auth_token"


@app.route("/confirm", methods=['GET'])
def incoming_sms():
    # unique_id = request.values.get('id', None)
    # Use a unique id associated with your user to figure out the Message Sid
    # of the message that prompted this action
    message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

    # Build the URL we need to report feedback
    url = 'https://api.twilio.com/2010-04-01/Accounts/' + \
        '{}/Messages/{}/Feedback.json'.format(ACCOUNT_SID, message_sid)

    # Send a POST request to the URL confirming that your user received
    # the text message Twilio sent them
    requests.post(
        url,
        data={'Outcome': 'confirmed'},
        auth=HTTPBasicAuth(ACCOUNT_SID, AUTH_TOKEN)
    )

    return ('Done!', 200)


if __name__ == "__main__":
    app.run(debug=True)
