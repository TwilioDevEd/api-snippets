# Installation
# python -m pip install requests

# Request
import requests

url = "https://api-sbox.dnlsrv.com/cigateway/id/v1/phoneIdResult"

payload = {
    "merchantId": "02200013919FB4",
    "subMerchantId": "00DF00000016",
    "correlationId": "984681AFDB698C67",
    "associationKey": "244464DFCB537E56",
    "match": {"consumerMdn": "+14085040458"}
}
headers = {
    "Authorization": "y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No",
    "Content-Type": "application/json",
    "Accept": "application/json",
    "RequestTime": "2022-08-01T09:33:43+00:00"
}

response = requests.post(url, json=payload, headers=headers)

print(response.text)
