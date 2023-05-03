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
                        audio_sources_excluded: ['advisor-audio'],
                        video_layout: {
                          'interviewed' => {
                            'z_pos' => 2,
                            'x_pos' => 400,
                            'y_pos' => 180,
                            'width' => 480,
                            'height' => 360,
                            'video_sources' => [
                              'interviewed-video',
                            ]
                          },
                          'interviewers' => {
                            'z_pos' => 1,
                            'x_pos' => 10,
                            'y_pos' => 0,
                            'width' => 1260,
                            'height' => 720,
                            'max_rows' => 3,
                            'max_columns' => 3,
                            'cells_excluded' => [
                              4,
                            ],
                            'reuse' => 'show_newest',
                            'video_sources' => [
                              'interviewer-*',
                            ]
                          }
                        },
                        status_callback: 'https://www.example.com/callbacks',
                        resolution: '1280x720',
                        format: 'mp4',
                        room_sid: 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
                      )

puts composition.sid

