# Get twilio-ruby from twilio.com/docs/ruby/install
require 'rubygems'          # This line not needed for ruby > 1.8
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC81e0c32a3c49700934481addd5ce1659'
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token


# Loop over authorized_apps and print out a property for each one
@client.account.authorized_connect_apps.list.each do |authorized_app|
    puts authorized_app.connect_app_homepage_url
end
