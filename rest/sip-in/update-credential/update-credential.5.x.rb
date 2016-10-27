require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@credential = @client.account.sip
                     .credential_lists('CL32a3c49700934481addd5ce1659f04d2')
                     .credentials('SC32a3c49700934481addd5ce1659f04d2')
                     .fetch

# Update credential password
@credential.update(password: '07')

puts @credential.username
