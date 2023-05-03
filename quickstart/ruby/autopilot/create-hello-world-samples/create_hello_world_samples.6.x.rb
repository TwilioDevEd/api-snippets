# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Build task actions that say something and listens for a repsonse.
phrases = [
    "hello",
    "hi",
    "Hello",
    "Hi there"
]

# Create the hello_world task
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
phrases.each do |phrase|
  sample = @client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                             .tasks("hello-world")
                             .samples
                             .create(
                               language: "en-us",
                               tagged_text: phrase
                             )

  puts sample.sid
end
