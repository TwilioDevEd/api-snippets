require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@credential_list_sid = 'CL32a3c49700934481addd5ce1659f04d2'

# Get credential list with given sid
@credential_list = @client.account.sip
                          .credential_lists(@credential_list_sid)
                          .fetch

# Print friendly name for credential list instance
puts @credential_list.friendly_name
