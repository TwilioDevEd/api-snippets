from flask import Flask
from twilio.twiml.voice_response import VoiceResponse

app = Flask(__name__)


@app.route("/record", methods=['GET', 'POST'])
def record():
    """Returns TwiML which prompts the caller to record a message"""
    # Start our TwiML response
    response = VoiceResponse()

    # Use <Say> to give the caller some instructions
    response.say('Hello. Please leave a message and I will transcribe it.')

    # Use <Record> to record and transcribe the caller's message
    response.record(transcribe=True, max_length=30)

    # End the call with <Hangup>
    response.hangup()

    return str(response)

if __name__ == "__main__":
    app.run()
