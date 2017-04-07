require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@cred_list_sid = 'CL32a3c49700934481addd5ce1659f04d2'
@cred_sid = 'SC32a3c49700934481addd5ce1659f04d2'

@credential = @client.account.sip
                     .credential_lists(@cred_list_sid)
                     .credentials(@cred_sid).fetch

puts @credential.username
