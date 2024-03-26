require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api-sbox.dnlsrv.com/cigateway/id/v2/match")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No'
request["Content-Type"] = 'application/json'
request["Accept"] = 'application/json'
request["RequestTime"] = '2022-08-01T09:33:43+00:00'
request.body = "{\"merchantId\":\"02200013919FB4\",\"consentId\":\"9783471AFDB69NH34\",\"consentTimeStamp\":\"2020-08-20T12:00:57+00:00\",\"msisdn\":\"+14444441333\",\"correlationId\":\"984681AFDB698C67\",\"firstName\":\"Michael\",\"lastName\":\"Johnson\",\"address1\":\"3701 Ashwood Dr\",\"address2\":\"Apt 20\",\"city\":\"Council Bluffs\",\"state\":\"IA\",\"postalCode\":\"51501\",\"countryCode\":\"US\",\"nationalId\":\"345678901\",\"dateOfBirth\":\"19800303\"}"

response = http.request(request)
puts response.read_body
