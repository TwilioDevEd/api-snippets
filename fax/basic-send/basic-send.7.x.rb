require 'net/http'
require 'json'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

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
