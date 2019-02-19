// Log your Client's LocalParticipant in the Room
const localParticipant = room.localParticipant;
console.log(
  'Connected to the Room as LocalParticipant "%s"',
  localParticipant.identity
);

// Log any Participants already connected to the Room
room.participants.forEach(function(participant) {
  console.log(
    'Participant "%s" is connected to the Room',
    participant.identity
  );
});

// Log new Participants as they connect to the Room
room.once('participantConnected', function(participant) {
  console.log(
    'Participant "%s" has connected to the Room',
    participant.identity
  );
});

// Log Participants as they disconnect from the Room
room.once('participantDisconnected', function(participant) {
  console.log(
    'Participant "%s" has disconnected from Room',
    participant.identity
  );
});
