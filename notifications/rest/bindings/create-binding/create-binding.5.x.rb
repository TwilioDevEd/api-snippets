# Download the Ruby helper library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

# Get your Account Sid and Auth Token from https://www.twilio.com/console
account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
auth_token = 'your_auth_token'
client = Twilio::REST::Client.new account_sid, auth_token

service = client.notify.services('ISxxx')

binding = service.bindings.create(
  endpoint: 'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJncmFudHMiOnsiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6IklTNmIwZmE2MDgzOWM1MTFlNWExNTFmZWZmODE5Y2RjOWYiLCJlbmRwb2ludF9pZCI6InR3aTEtMTdjNTkyM2Y5NTBiNGJhYjllZjAwZTJlZjdkYTBkYTIifSwiaWRlbnRpdHkiOiJOb3RpZmljYXRpb25MaWJyYXJ5VW5pdFRlc3RlcjEifSwic3ViIjoiQUM3OGU4ZTY3ZmMwMjQ2NTIxNDkwZmI5OTA3ZmQwYzE2NSIsImlzcyI6IlNLMmQxYWRmOGIxYzY0YTYzM2U1ZjE4NjU5ZjdjZDE5MTEiLCJleHAiOjE0NzgyNTI4NTl9.1i256CwtacP859Xh-6cEZVio4oohxL-od9krzsa4DnY',
  identity: '00000001',
  binding_type: 'apn',
  address: '483161f7afe6f012aa5f172d3ca93f5c245e3daf34d3a911a41f41f6af3639f6',
  tag: 'new user'
)

puts binding
