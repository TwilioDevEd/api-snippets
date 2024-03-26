require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://api-sbox.dnlsrv.com/cigateway/id/v1/phoneIdResult")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No'
request["Content-Type"] = 'application/json'
request["Accept"] = 'application/json'
request["RequestTime"] = '2022-08-01T09:33:43+00:00'
request.body = "{\"merchantId\":\"02200013919FB4\",\"subMerchantId\":\"00DF00000016\",\"correlationId\":\"984681AFDB698C67\",\"associationKey\":\"244464DFCB537E56\",\"match\":{\"consumerMdn\":\"+14085040458\"}}"

response = http.request(request)
puts response.read_body
