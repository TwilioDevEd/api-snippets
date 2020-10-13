// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const API_KEY_SID = process.env.TWILIO_API_KEY;
const API_KEY_SECRET = process.env.TWILIO_API_KEY_SECRET;
const ACCOUNT_SID = process.env.TWILIO_ACCOUNT_SID;

const Twilio = require('twilio');

const client = new Twilio(API_KEY_SID, API_KEY_SECRET, {accountSid: ACCOUNT_SID});

client.video.compositions.
  create({
    roomSid: 'RMXXXX',
    audioSources: '*',
    videoLayout: {
      main: {
        z_pos: 1,
        video_sources: ['teacher-screen-video']
      },
      row: {
        z_pos: 2,
        x_pos: 10,
        y_pos: 530,
        width: 1260,
        height: 160,
        max_rows: 1,
        video_sources: ['*'],
        video_sources_excluded: ['teacher-screen-video']
      }
    },
    statusCallback: 'http://my.server.org/callbacks',
    resolution: '1280x720',
    format: 'mp4'
  })
  .then(composition =>{
    console.log('Created Composition with SID=' + composition.sid);
  });
