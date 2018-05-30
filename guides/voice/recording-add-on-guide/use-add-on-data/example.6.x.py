from flask import Flask, request
from twilio.twiml.voice_response import VoiceResponse
import json
import os
import requests

app = Flask(__name__)


@app.route("/voice", methods=['GET', 'POST'])
def voice():
    # Start our TwiML response
    response = VoiceResponse()
    response.say('Hi! I want to know what do you think about coding.')
    response.record(maxLength="10", action="/recording")
    response.hangup()

    return str(response)


@app.route("/recording", methods=['GET', 'POST'])
def recording():
    recording_url = request.values.get("RecordingUrl", None)
    print(recording_url)

    response = VoiceResponse()
    response.say("Thanks for howling... take a listen to what you howled.")
    response.play(recording_url)
    response.say("Goodbye.")

    return str(response)


@app.route("/callback", methods=['POST', 'PUT'])
def callback():
    add_ons = json.loads(request.values['AddOns'])

    # If the Watson Speech to Text add-on found nothing, return immediately
    if 'ibm_watson_speechtotext' not in add_ons['results']:
        return 'Add Watson Speech to Text add-on in your Twilio console'

    payload_url = add_ons["results"]["ibm_watson_speechtotext"]["payload"][0]["url"]

    account_sid = os.environ.get('TWILIO_ACCOUNT_SID')
    auth_token = os.environ.get('TWILIO_AUTH_TOKEN')
    resp = requests.get(payload_url, auth=(account_sid, auth_token)).json()

    results = resp['results'][0]['results']
    transcripts = map(lambda res: res['alternatives'][0]['transcript'], results)

    return ''.join(transcripts)


if __name__ == "__main__":
    app.run()
