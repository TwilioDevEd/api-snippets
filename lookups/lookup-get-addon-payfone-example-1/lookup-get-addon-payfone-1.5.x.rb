require 'uri'
require 'net/http'

# Use Lookups API to get information about a phone number
url = URI('https://lookups.twilio.com/v1/PhoneNumbers/+16502530000/?AddOns=payfone_tcpa_compliance&AddOns.payfone_tcpa_compliance.RightPartyContactedDate=20160101')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
# All Twilio requests use HTTP basic auth -> http://en.wikipedia.org/wiki/Basic_access_authentication
request.basic_auth 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX', 'your_auth_token'
request['accept'] = 'application/json'
request['content-type'] = 'application/json'

response = http.request(request)
puts response.read_body
