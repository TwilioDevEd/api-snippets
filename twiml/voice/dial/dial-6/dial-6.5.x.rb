require 'twilio-ruby'

response = Twilio::TwiML::VoiceResponse.new
dial = Twilio::TwiML::Dial.new(record: 'record-from-ringing-dual',
  recording_status_callback: 'www.myexample.com')
dial.conference('myteamroom')
response.append(dial)

puts response
