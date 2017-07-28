"""
Basic example of SMS and MMS response with Twilio.

Demostrates webhook validation, matching against a master number, and the
use of the Twilio Python helper library.
"""

from __future__ import print_function

import os
import urllib
from twilio import twiml
from twilio.request_validator import RequestValidator

twilio_master_number = os.environ['MASTER_NUMBER']


def handler(event, context):
    """Lambda function handler for Twilio response."""
    resp = twiml.Response()
    print("Event:", event)
    if u'twilioSignature' in event and u'Body' in event \
            and event['Body'].lower() == "secret":

        form_parameters = {
            k: urllib.unquote_plus(v) for k, v in event.items()
            if k != u'twilioSignature'
        }

        validator = RequestValidator(os.environ['AUTH_TOKEN'])
        request_valid = validator.validate(
            os.environ['REQUEST_URL'],
            form_parameters,
            event[u'twilioSignature']
        )

        # print("Form params:",form_parameters,"validity:",request_valid)
        # If the request is valid and this is from the master number,
        # give the secret!
        if request_valid and u'From' in form_parameters and \
                form_parameters[u'From'] == \
                os.environ['MASTER_NUMBER'].encode('utf8'):
            # The message is validated and is from the master number

            secret_message = "I am putting myself to the fullest possible"   \
                             " use, which is all I think that any conscious" \
                             " entity can ever hope to do."

            msg = resp.message(secret_message)
            # The following lines add media to an MMS reply
            msg.media('https://upload.wikimedia.org/wikipedia/commons/thumb'
                      '/f/f6/HAL9000.svg/200px-HAL9000.svg.png')
            return str(resp)

        else:
            # Validation failed in some way; don't give up the secret

            secret_message = "I'm sorry, Dave. I'm afraid I can't do that."
            resp.message(secret_message)
            return str(resp)

    else:
        resp.message("Hello world! -Lambda")
        return str(resp)
