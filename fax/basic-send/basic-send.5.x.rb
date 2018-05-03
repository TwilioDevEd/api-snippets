require 'net/http'
require 'json'

# Get your Account SID and Auth Token from twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

uri = URI('https://fax.twilio.com/v1/Faxes')

Net::HTTP.start(uri.host, uri.port,
                use_ssl: uri.scheme == 'https') do |http|

  request = Net::HTTP::Post.new uri.request_uri
  request.basic_auth account_sid, auth_token
  request.body = URI.encode_www_form(To: '+15558675310',
                                     From: '+15017122661',
                                     MediaUrl: 'https://www.twilio.com/docs/documents/25/justthefaxmaam.pdf')

  response = http.request request

  puts JSON.parse(response.body)['sid']
end
