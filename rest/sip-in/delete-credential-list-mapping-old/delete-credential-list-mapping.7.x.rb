require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@sip_domain_sid = 'SD32a3c49700934481addd5ce1659f04d2'
@cred_list_mapping_sid = 'CL32a3c49700934481addd5ce1659f04d2'

@cred_list_mapping = @client.sip
                            .domains(@sip_domain_sid)
                            .credential_list_mappings(@cred_list_mapping_sid)

@cred_list_mapping.delete
