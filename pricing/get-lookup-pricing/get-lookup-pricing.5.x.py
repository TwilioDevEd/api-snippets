from twilio.rest import TwilioPricingClient, TwilioLookupsClient

# Auth credentials
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "your_auth_token"

# Use Lookup API to get country code / MCC / MNC that corresponds
# to given phone number
phone_number = "+15108675310"
print("Find outbound SMS price to:", phone_number)

client = TwilioLookupsClient(account_sid, auth_token)
number = client.phone_numbers.get(phone_number, include_carrier_info=True)
mcc = number.carrier['mobile_country_code']
mnc = number.carrier['mobile_network_code']
country_code = number.country_code

# Use Pricing API to find the matching base/current prices to call that
# particular country / MCC / MNC from local phone number
client = TwilioPricingClient(account_sid, auth_token)
messaging_country = client.messaging_countries().get(country_code)

for country in messaging_country.outbound_sms_prices:
    if ((country['mcc'] == mcc) and (country['mnc'] == mnc)):
        for price in country['prices']:
            if (price['number_type'] == "local"):
                print("Country: ", country_code)
                print("Base Price: ", price['base_price'])
                print("Current Price: ", price['current_price'])
