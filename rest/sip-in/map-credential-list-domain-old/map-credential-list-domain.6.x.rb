require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@cred_list_sid = 'CL32a3c49700934481addd5ce1659f04d2'

# Get the credential mappings for the given sip domain and add a credential list
cred_list_mapping = @client.sip
                           .domains('SD32a3c49700934481addd5ce1659f04d2')
                           .credential_list_mappings
                           .create(credential_list_sid: @cred_list_sid)

puts cred_list_mapping.friendly_name
