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
      chess_table : {
        x_pos: 10,
        y_pos: 0,
        width: 1260,
        height: 720,
        max_rows: 3,
        max_columns: 3,
        reuse: "show_newest",
        cells_excluded: [1,3,5,7],
        video_sources: ['*']
      }
    },
    statusCallback: 'http://my.server.org/callbacks',
    resolution: '1280x720',
    format: 'mp4'
  })
  .then(composition =>{
    console.log('Created Composition with SID=' + composition.sid);
  });
