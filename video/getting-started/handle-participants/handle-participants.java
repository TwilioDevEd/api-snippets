// Connect to room
Room room = Video.connect(context, connectOptions, new Room.Listener() {
    @Override
    public void onConnected(Room room) {}

    @Override
    public void onConnectFailure(Room room, TwilioException e) {}

    @Override
    public void onDisconnected(Room room, TwilioException e) {}

    @Override
    public void onRecordingStarted(Room room) {}

    @Override
    public void onRecordingStopped(Room room) {}

    @Override
    public void onParticipantConnected(Room room, Participant participant) {
        Log.i("Room.Listener", participant.getIdentity() + " has joined the room.");
    }

    @Override
    public void onParticipantDisconnected(Room room, Participant participant) {
        Log.i("Room.Listener", participant.getIdentity() + " has left the room.");
    }
);

// ... Assume we have received the connected callback

// After receiving the connected callback the LocalParticipant becomes available
LocalParticipant localParticipant = room.getLocalParticipant();
Log.i("LocalParticipant ", localParticipant.getIdentity());

// Get a participant from the room (let's assume we have a participant named Alice)
Participant participant = room.getParticipants().get("Alice");
Log.i("HandleParticipants", participant.getIdentity() + " is in the room.");
