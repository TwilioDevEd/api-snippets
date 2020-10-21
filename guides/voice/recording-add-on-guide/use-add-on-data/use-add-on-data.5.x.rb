require 'sinatra'
require 'twilio-ruby'
require 'json'
require 'httparty'

post '/voice' do
  Twilio::TwiML::VoiceResponse.new do |r|
    r.say(message: 'Hi! I want to know what do you think about coding.')
    r.record(maxLength: '10', action: '/recording')
    r.hangup
  end.to_s
end

post '/recording' do
  recording_url = params['RecordingUrl']
  puts recording_url

  Twilio::TwiML::VoiceResponse.new do |r|
    r.say(message: 'Thanks for howling... take a listen to what you howled.')
    r.play(url: recording_url)
    r.say(message: 'Goodbye.')
  end.to_s
end

post '/callback' do
  add_ons = JSON.parse(params['AddOns'])

  unless add_ons['results'].key? 'ibm_watson_speechtotext'
    return 'Add Watson Speech to Text add-on in your Twilio console'
  end

  payload_url = add_ons['results']['ibm_watson_speechtotext']['payload'][0]['url']

# To set up environmental variables, see http://twil.io/secure
  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']
  resp = HTTParty.get(
    payload_url,
    basic_auth: { username: account_sid, password: auth_token }
  )

  results = resp['results'][0]['results']
  transcripts = results.map { |item| item['alternatives'][0]['transcript'] }

  return transcripts
end
