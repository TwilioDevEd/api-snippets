require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@sip_domain_sid = 'SD32a3c49700934481addd5ce1659f04d2'
@cred_list_mapping_sid = 'CL32a3c49700934481addd5ce1659f04d2'

@cred_list_mapping = @client.account.sip
                            .domains(@sip_domain_sid)
                            .credential_list_mappings(@cred_list_mapping_sid)

@cred_list_mapping.delete
