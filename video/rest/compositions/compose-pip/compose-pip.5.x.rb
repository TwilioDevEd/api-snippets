# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your credentials at twilio.com/console
# To set up environmental variables, see http://twil.io/secure
api_key_sid = ENV['TWILIO_API_KEY']
api_key_secret = ENV['TWILIO_API_KEY_SECRET']

@client = Twilio::REST::Client.new(api_key_sid, api_key_secret)

composition = @client.video.compositions.create(
  room_sid: 'RMXXXX',
  audio_sources: ['MTAAAA','soundtrack'],
  video_layout: {
    main: {
      z_pos: 1,
      video_sources: ['screen-presentation']
    },
    pip: {
      z_pos: 2,
      x_pos: 1000,
      y_pos: 30,
      width: 240,
      height: 180,
      video_sources: ['MTBBBB']
    }
  },
  status_callback: 'http://my.server.org/callbacks',
  resolution: '1280x720',
  format: 'mp4'
)

puts composition.sid
