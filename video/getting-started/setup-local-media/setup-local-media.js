// If you are requiring twilio-video from CommonJS,
//
//     const Video = Twilio.Video;
//
//  If you are including twilio-video.js from a <script> tag,
//
//     const Video = require('twilio-video');
//

const localMedia = new Video.LocalMedia();

// You can call getUserMedia and add the resulting MediaStream to localMedia.
Video.getUserMedia().then(mediaStream => {
  localMedia.addStream(mediaStream);
});

// Or you can add the microphone and camera independently.
localMedia.addMicrophone().then(() => {
  return localMedia.addCamera();
});

// Remove the microphone.
localMedia.removeMicrophone();

// Remove the camera.
localMedia.removeCamera();

// Remove any tracks on the localMedia.
localMedia.tracks.forEach(track => {
  localMedia.removeTrack(track);
});

// Stop localMedia and all Tracks on it.
localMedia.stop();
