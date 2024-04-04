# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Your Account Sid and Auth Token from twilio.com/console
# To set up environmental variables, see http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Build task actions that say something and listens for a repsonse.
hello_world_task_actions = {
  "actions" => [
    { "say": "Hi there, I'm your virtual assistant! How can I help you?" },
    { "listen": true }
  ]
}

# Create the hello_world task
# Replace 'UAXXX...' with your Assistant's unique SID https://www.twilio.com/console/autopilot/list
task = @client.autopilot.assistants('UAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                         .tasks
                         .create(
                           unique_name: "hello-world",
                           actions: hello_world_task_actions
                         )

puts "Hello-world task has been created!"
puts task.sid
