from flask import Flask, request
from twilio import twiml

import json


app = Flask(__name__)

@app.route("/voice", methods=['GET', 'POST'])
def call():
    """Responds to incoming calls using Twilio Add-ons"""
    # Start our TwiML response
    response = twiml.Response()

    # Decode the JSON included in the 'AddOns' field
    add_ons = json.loads(request.values['AddOns'])

    # If the Whitepages add-on found nothing, return immediately
    if 'whitepages_pro_caller_id' not in add_ons['results']:
        response.say('Sorry, I could not learn anything about you.')
        response.hangup()

        return str(response)

    # Otherwise, extract the Whitepages data
    whitepages = add_ons['results']['whitepages_pro_caller_id']

    # Grab the first result Whitepages gave us
    # (see the "Documentation" tab on the Whitepages add-on for more details)
    caller_id = whitepages['result']['results'][0]

    # See if we can get the caller's name
    try:
        first_name = caller_id['belongs_to'][0]['names'][0]['first_name']
    except (IndexError, KeyError):
        first_name = 'a mystery'

    # And what city the caller lives in
    try:
        city = caller_id['associated_locations'][0]['city']
    except (IndexError, KeyError):
        city = 'a mystery'

    # Tell the caller what we think their name and city are
    response.say('Hello. Your name is {}.'.format(first_name))
    response.say('And I think you live in {}.'.format(city))

    # Then end the call
    response.hangup()

    return str(response)

if __name__ == "__main__":
    app.run(debug=True)
