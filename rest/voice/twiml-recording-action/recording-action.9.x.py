from flask import Flask, request
# from __future__ import with_statement   # Only necessary for Python 2.5
from twilio.twiml.voice_response import VoiceResponse

app = Flask(__name__)


@app.route("/handle-recording", methods=['GET', 'POST'])
def handle_recording():
    """Play back the caller's recording."""

    recording_url = request.values.get("RecordingUrl", None)

    resp = VoiceResponse()
    resp.say("Listen to your recorded message.")
    resp.play(recording_url)
    resp.say("Goodbye.")
    return str(resp)


if __name__ == "__main__":
    app.run(debug=True)
