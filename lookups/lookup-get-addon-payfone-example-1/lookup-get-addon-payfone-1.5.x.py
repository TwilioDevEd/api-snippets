import requests

url = 'https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/' + \
    '?AddOns=payfone_tcpa_compliance&' + \
    'AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101'

headers = {'accept': "application/json", 'content-type': "application/json"}

response = requests.get(
    url,
    headers=headers,
    auth=('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'your_auth_token')
)

print(response.text)
