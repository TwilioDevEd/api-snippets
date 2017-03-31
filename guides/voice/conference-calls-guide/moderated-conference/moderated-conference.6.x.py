from flask import Flask, request
from twilio.twiml.voice_response import VoiceResponse, Dial

app = Flask(__name__)

# Update with your own phone number in E.164 format
MODERATOR = '+15558675309'


@app.route("/voice", methods=['GET', 'POST'])
def call():
    """Returns TwiML for a moderated conference call"""
    # Start our TwiML response
    response = VoiceResponse()

    # Start with a <Dial> verb
    dial = Dial()
    # If the caller is our MODERATOR, then start the conference when they
    # join and end the conference when they leave
    if request.values.get('From') == MODERATOR:
        dial.conference(
            'My conference',
            startConferenceOnEnter=True,
            endConferenceOnExit=True)
    else:
        # Otherwise have the caller join as a regular participant
        dial.conference('My conference', startConferenceOnEnter=False)

    return str(response.append(dial))

if __name__ == "__main__":
    app.run(debug=True)
