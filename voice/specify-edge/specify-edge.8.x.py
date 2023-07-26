import os
from twilio.rest import Client


account_sid = os.environ['ACCOUNT_SID']
api_key_sid = os.environ['API_KEY_SID']
api_key_secret = os.environ['API_KEY_SECRET']

to_number = os.environ['TO_NUMBER']
from_number = os.environ['FROM_NUMBER']

client = Client(
    account_sid=account_sid,
    username=api_key_sid,
    password=api_key_secret,
    edge='dublin',
    region='ie1'
)

call = client.calls.create(
    twiml='<Response><Say>Ahoy from Ireland</Say></Response>',
    to=to_number,
    from_=from_number
)
