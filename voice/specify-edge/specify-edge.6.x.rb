require "twilio-ruby"

account_sid = ENV["ACCOUNT_SID"]
api_key_sid = ENV["API_KEY_SID"]
api_key_secret = ENV["API_KEY_SECRET"]

to_number = ENV["TO_NUMBER"]
from_number = ENV["FROM_NUMBER"]

@client = Twilio::REST::Client.new(
    api_key_sid,
    api_key_secret,
    account_sid
)

@client.edge = "dublin"
@client.region = "ie1"

call = @client.calls.create(
    twiml: '<Response><Say>Ahoy from Ireland</Say></Response>',
    to: to_number,
    from: from_number
)
