from twilio import IpMessagingGrant

endpoint = 'https://some.endpoint'
service_sid = 'ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

ipm_grant = IpMessagingGrant(
    endpoint_id=endpoint,
    service_sid=service_sid,
    push_credential_sid='CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
)
