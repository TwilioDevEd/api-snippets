# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems' # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account SID and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new account_sid, auth_token

@domain_sip = 'SD32a3c49700934481addd5ce1659f04d2'
@new_map = { ip_access_control_list_sid: 'AL32a3c49700934481addd5ce1659f04d2' }

@ip_access_control_list_mapping = @client
                                  .sip.domains(@domain_sip)
                                  .ip_access_control_list_mappings
                                  .create(@new_map)

puts @ip_access_control_list_mapping.friendly_name
