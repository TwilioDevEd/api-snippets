from flask import Flask, request
from twilio import twiml

app = Flask(__name__)


@app.route("/voice", methods=['GET', 'POST'])
def voice():
    """Respond to incoming phone calls and mention the caller's city"""
    # Get the caller's city from Twilio's request to our app
    city = request.values['FromCity']

    # Start our TwiML response
    resp = twiml.Response()

    # Read a message aloud to the caller
    resp.say('Never gonna give you up, {}!'.format(city), voice='alice')

    # Play an audio file for the caller
    resp.play('https://demo.twilio.com/docs/classic.mp3')

    return str(resp)

if __name__ == "__main__":
    app.run(debug=True)
