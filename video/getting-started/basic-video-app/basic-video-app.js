const joinForm = document.getElementById("join");
const roomName = document.getElementById("room");
const participantIdentity = document.getElementById("identity");
const participantsContainer = document.getElementById("participants");

const startRoom = async (event) => {
  // prevent a page reload when a user submits the form
  event.preventDefault();
  // hide the join form
  joinForm.style.visibility = "hidden";

  // TODO: fetch an Access Token for this participant
  // from your Access Token server, or generate a token
  // and paste it here.
  // Learn more: https://www.twilio.com/docs/video/tutorials/user-identity-access-tokens
  const token = "YOUR ACCESS TOKEN (JWT) HERE"

  // join the video room with the token
  const room = await Twilio.Video.connect(token, {});

  // render the local and remote participants' video and audio tracks
  handleConnectedParticipant(room.localParticipant);
  room.participants.forEach(handleConnectedParticipant);
  room.on("participantConnected", handleConnectedParticipant);

  // handle cleanup when a participant disconnects by closing the browser window
  room.on("participantDisconnected", handleDisconnectedParticipant);
  window.addEventListener("pagehide", () => room.disconnect());
  window.addEventListener("beforeunload", () => room.disconnect());
};

const handleConnectedParticipant = (participant) => {
  // create a div for this participant's tracks and add it to
  // the main participants' div
  const participantDiv = document.createElement("div");
  participantDiv.setAttribute("id", participant.sid);
  participantsContainer.appendChild(participantDiv);

  // iterate through the participant's published tracks and
  // call `handleTrackPublication` on them
  participant.tracks.forEach((trackPublication) => {
    handleTrackPublication(trackPublication, participant.sid);
  });

  // listen for any new track publications
  participant.on("trackPublished", (trackPublication) => {
      handleTrackPublication(trackPublication, participant.sid);
  });
};

const handleTrackPublication = (trackPublication, participantSid) => {
  function displayTrack(track) {
    // append this track to the participant's div and render it on the page
    const participantDiv = document.getElementById(participantSid);
    // track.attach creates an HTMLVideoElement or HTMLAudioElement
    // (depending on the type of track) and adds the video or audio stream
    participantDiv.append(track.attach());
  }

  // check if the trackPublication contains a `track` attribute. If it does,
  // this localParticipant is subscribed to this track.
  if (trackPublication.track) {
    displayTrack(trackPublication.track);
  }

  // listen for any new subscriptions to this track publication
  trackPublication.on("subscribed", displayTrack);
};

const handleDisconnectedParticipant = (participant) => {
  // stop listening for this participant's events
  participant.removeAllListeners();
  // remove this participant's div from the page
  const participantDiv = document.getElementById(participant.sid);
  participantDiv.remove();
};

joinForm.addEventListener("submit", startRoom);
