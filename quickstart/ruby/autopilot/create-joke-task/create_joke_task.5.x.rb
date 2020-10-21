# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Provide actions for the new task
joke_actions = {
  "actions" => [
    { "say": "I was going to look for my missing watch, but I could never find the time." },
  ]
}

# Create a new task named 'tell_a_joke'
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
task = @client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                         .tasks
                         .create(
                           unique_name: "tell-a-joke",
                           actions: joke_actions
                         )

puts "Tell-a-joke task has been created!"
puts task.sid
