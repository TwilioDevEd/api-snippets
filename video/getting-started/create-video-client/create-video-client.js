// If you are requiring twilio-video from CommonJS,
//
//     const Video = require('twilio-video');
//
//  If you are including twilio-video.js from a <script> tag,
//
//     const Video = Twilio.Video;
//

// 1.0.0-beta4 and earlier
// const client = new Video.Client(accessToken);

// 1.0.0-beta5 onwards the Client class has been removed.
// Instead of constructing a Client using an Access Token and then calling connect
// on it, you can simply call connect and pass it an Access Token directly.
const room = Twilio.Video.connect('your-token');
