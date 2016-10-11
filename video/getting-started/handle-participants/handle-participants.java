// Connect to room
Room room = videoClient.connect(connectOptions, new Room.Listener() {
    @Override
    public void onConnected(Room room) {}

    @Override
    public void onConnectFailure(Room room, VideoException e) {}

    @Override
    public void onDisconnected(Room room, VideoException e) {}

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
