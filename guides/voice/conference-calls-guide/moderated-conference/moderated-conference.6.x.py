"""Demonstration of setting up a conference call in Flask with Twilio."""
from flask import Flask, request
from twilio.twiml.voice_response import VoiceResponse, Dial

app = Flask(__name__)

# Update with your own phone number in E.164 format
MODERATOR = '+18005551212'


@app.route("/voice", methods=['GET', 'POST'])
def call():
    """Return TwiML for a moderated conference call."""
    # Start our TwiML response
    response = VoiceResponse()

    # Start with a <Dial> verb
    with Dial() as dial:
        # If the caller is our MODERATOR, then start the conference when they
        # join and end the conference when they leave
        if request.values.get('From') == MODERATOR:
            dial.conference(
                'My conference',
                start_conference_on_enter=True,
                end_conference_on_exit=True)
        else:
            # Otherwise have the caller join as a regular participant
            dial.conference('My conference', start_conference_on_enter=False)

    response.append(dial)
    return str(response)

if __name__ == "__main__":
    app.run(debug=True)
