from flask import Flask, request
from requests.auth import HTTPBasicAuth

import logging
import requests

logging.basicConfig(level=logging.INFO)

app = Flask(__name__)

@app.route("/confirm", methods=['GET'])
def incoming_sms():
    unique_id = request.values.get('id', None)

    # Use a unique id associated with your user to figure out the Message Sid
    # of the message that prompted this action
    message_sid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

    # Get your Account Sid and Auth Token from twilio.com/console
    account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
    auth_token = "your_auth_token"


    client = Client(account_sid, auth_token)
    client.messages(message_sid) \
          .feedback
          .create(outcome="confirmed")

    return ('Thank you!', 200)

if __name__ == "__main__":
    app.run(debug=True)
