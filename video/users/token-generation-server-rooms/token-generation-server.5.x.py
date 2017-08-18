import os
from flask import Flask, jsonify
from faker import Factory
from twilio.access_token import AccessToken, VideoGrant

app = Flask(__name__)
fake = Factory.create()


@app.route('/')
def index():
    return app.send_static_file('index.html')


@app.route('/token')
def token():
    # get credentials for environment variables
    account_sid = os.environ['TWILIO_ACCOUNT_SID']
    api_key = os.environ['TWILIO_API_KEY']
    api_secret = os.environ['TWILIO_API_SECRET']

    # Create an Access Token
    token = AccessToken(account_sid, api_key, api_secret)

    # Set the Identity of this token
    token.identity = fake.user_name()

    # Grant access to Twilio Video
    grant = VideoGrant()
    grant.configuration_profile_sid = os.environ['TWILIO_CONFIGURATION_SID']
    token.add_grant(grant)

    # Return token info as JSON
    return jsonify(identity=token.identity, token=token.to_jwt())


if __name__ == '__main__':
    app.run(debug=True)
