from flask import Flask
from twilio.twiml.voice_response import VoiceResponse

app = Flask(__name__)


@app.route("/", methods=['GET', 'POST'])
def voice():
    """Respond to incoming calls with a simple text message."""

    resp = VoiceResponse()
    resp.say("Hello. It's me.")
    resp.play("https://deved-sample-assets-2691.twil.io/ahoyhoy.mp3")
    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
