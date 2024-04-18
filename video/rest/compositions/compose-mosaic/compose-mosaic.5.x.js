// Download the helper library from https://www.twilio.com/docs/node/install
// Find your Account SID and Auth Token at twilio.com/console
// and set the environment variables. See http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.video.compositions
            .create({
               audioSources: ['*'],
               audioSourcesExcluded: ['advisor-audio'],
               videoLayout: {
                 interviewed: {
                   z_pos: 2,
                   x_pos: 400,
                   y_pos: 180,
                   width: 480,
                   height: 360,
                   video_sources: [
                     'interviewed-video'
                   ]
                 },
                 interviewers: {
                   z_pos: 1,
                   x_pos: 10,
                   y_pos: 0,
                   width: 1260,
                   height: 720,
                   max_rows: 3,
                   max_columns: 3,
                   cells_excluded: [
                     4
                   ],
                   reuse: 'show_newest',
                   video_sources: [
                     'interviewer-*'
                   ]
                 }
               },
               statusCallback: 'https://www.example.com/callbacks',
               resolution: '1280x720',
               format: 'mp4',
               roomSid: 'RMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
             })
            .then(composition => console.log(composition.sid));

