require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(account_sid, auth_token)

@cred_list_sid = 'CL32a3c49700934481addd5ce1659f04d2'

# Get an object from its sid. If you do not have a sid,
# check out the list resource examples on this page
@credential_list = @client.sip
                          .credential_lists(@cred_list_sid).fetch

@credential_list.update(friendly_name: 'Marlos Lieutenants')

puts @credential_list.friendly_name
