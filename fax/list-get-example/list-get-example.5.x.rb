require 'net/http'
require 'json'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

uri = URI('https://fax.twilio.com/v1/Faxes')

Net::HTTP.start(uri.host, uri.port,
                use_ssl: uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth account_sid, auth_token

  response = http.request request

  JSON.parse(response.body)['faxes'].each do |fax|
    puts fax['media_url']
  end
end
