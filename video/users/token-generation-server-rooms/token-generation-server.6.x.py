import os
from flask import Flask, jsonify, request
from twilio.jwt.access_token import AccessToken
from twilio.jwt.access_token.grants import VideoGrant
from dotenv import load_dotenv, find_dotenv

app = Flask(__name__)
load_dotenv(find_dotenv())

@app.route('/')
def token():
    # Get credentials for environment variables
    account_sid = os.environ['TWILIO_ACCOUNT_SID']
    api_key = os.environ['TWILIO_API_KEY']
    api_secret = os.environ['TWILIO_API_SECRET']

    # Create an Access Token
    token = AccessToken(account_sid, api_key, api_secret)

    # Set the Identity of this token
    token.identity = request.values.get('identity') or 'identity'
    
    # Grant access to Video
    grant = VideoGrant()
    grant.room = request.values.get('room')
    token.add_grant(grant)

    # Return token
    return token.to_jwt()

if __name__ == '__main__':
    app.run(debug=True)
