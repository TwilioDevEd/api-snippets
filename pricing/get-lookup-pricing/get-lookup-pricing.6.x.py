import os
from twilio.rest import Client

# Auth credentials
# To set up environmental variables, see http://twil.io/secure
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']

# Use Lookup API to get country code / MCC / MNC that corresponds
# to given phone number
phone_number = "+15108675310"
print("Find outbound SMS price to: ", phone_number)

client = Client(account_sid, auth_token)
number = client.lookups.phone_numbers(phone_number).fetch()

mcc = number.carrier['mobile_country_code']
mnc = number.carrier['mobile_network_code']
country_code = number.country_code

# Use Pricing API to find the matching base/current prices to call that
# particular country / MCC / MNC from local phone number
messaging_country = client.pricing \
                          .messaging \
                          .countries(country_code) \
                          .fetch()

for country in messaging_country.outbound_sms_prices:
    if ((country['mcc'] == mcc) and (country['mnc'] == mnc)):
        for price in country['prices']:
            if (price['number_type'] == "local"):
                print("Country: ", country_code)
                print("Base Price: ", price['base_price'])
                print("Current Price: ", price['current_price'])
