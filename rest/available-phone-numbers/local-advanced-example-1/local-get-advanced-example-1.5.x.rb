# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'

# Initialize Twilio Client
@client = Twilio::REST::Client.new(account_sid, auth_token)

# Get the accounts with the given sid
@accounts = @client.api.v2010.accounts(account_sid)

# Retrieve available phone numbers in near specified latitude and longitude
# for the given account sid
@numbers = @accounts.available_phone_numbers('US')
                   .local.list(
                     near_lat_long: '37.840699,-122.461853',
                     distance: '50',
                     contains: '555',
                     in_region: 'CA'
                   )

# Get the first number
@number = @numbers[0].phone_number

# Purchase the number
@accounts.incoming_phone_numbers.create(phone_number: @number)
