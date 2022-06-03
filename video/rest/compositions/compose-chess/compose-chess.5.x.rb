# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

composition = @client.video
                     .compositions
                     .create(
                        audio_sources: ['*'],
                        video_layout: {
                          'chess_table' => {
                            'x_pos' => 10,
                            'y_pos' => 0,
                            'width' => 1260,
                            'height' => 720,
                            'max_rows' => 3,
                            'max_columns' => 3,
                            'reuse' => 'show_newest',
                            'cells_excluded' => [
                              1,
                              3,
                              5,
                              7,
                            ],
                            'video_sources' => [
                              '*',
                            ]
                          }
                        },
                        status_callback: 'https://www.example.com/callbacks',
                        resolution: '1280x720',
                        format: 'mp4',
                        room_sid: 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
                      )

puts composition.sid

