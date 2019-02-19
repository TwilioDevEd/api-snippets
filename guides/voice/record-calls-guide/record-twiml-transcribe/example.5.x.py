from flask import Flask
from twilio import twiml

app = Flask(__name__)


@app.route("/record", methods=['GET', 'POST'])
def record():
    """Returns TwiML which prompts the caller to record a message"""
    # Start our TwiML response
    response = twiml.Response()

    # Use <Say> to give the caller some instructions
    response.say('Hello. Please leave a message and I will transcribe it.')

    # Use <Record> to record and transcribe the caller's message
    response.record(transcribe=True, maxLength=30)

    # End the call with <Hangup>
    response.hangup()

    return str(response)

if __name__ == "__main__":
    app.run()
