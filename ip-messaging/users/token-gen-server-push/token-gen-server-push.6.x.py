from twilio.jwt.access_token.grants import ChatGrant

endpoint = 'https://some.endpoint'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

grant = ChatGrant(
    endpoint_id=endpoint,
    service_sid=service_sid,
    push_credential_sid='CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
)
