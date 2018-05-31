#!/usr/bin/env python
"""Fax snippet."""

from flask_script import Manager
from flask import Flask, Response, request

app = Flask(__name__)


@app.route('/fax/sent', methods=['POST'])
def fax_sent():
    """Define a handler for when the fax is initially sent."""
    # Let's manually build some TwiML. We can choose to receive the
    # fax with <Receive>, or reject with <Reject>.
    twiml = """
        <Response>
            <Receive action="/fax/received"/>
        </Response>
    """

    return Response(twiml, mimetype='text/xml')


@app.route('/fax/received', methods=['POST'])
def fax_received():
    """Define a handler for when the fax finished sending to us."""
    # We will have a URL to the contents of the fax at this point
    # log the URL of the PDF received in the fax
    print(request.form.get('MediaUrl'))

    # Respond with empty 200/OK to Twilio
    return '', 200


if __name__ == "__main__":
    Manager(app).run()
