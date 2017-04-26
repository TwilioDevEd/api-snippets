// Specify the room you would like to join
String roomName = "my-room";
ConnectOptions connectOptions = new ConnectOptions.Builder(accessToken)
    .roomName(roomName)
    .audioTracks(localAudioTracks)
    .videoTracks(localVideoTracks)
    .build();

// Create a room listener
Room.Listener roomListener = new Room.Listener() {
    @Override
    public void onConnected(Room room) {
        // Notifies you that you are now connected to the Room
    }

    @Override
    public void onConnectFailure(Room room, TwilioException e) {
        // Notifies you that a failure occurred when attempting to the connect to the room
    }

    @Override
    public void onDisconnected(Room room, TwilioException e) {
        // Notifies you that you were disconnected from the Room
    }

    @Override
    public void onParticipantConnected(Room room, Participant participant) {
        // A participant joined the Room
    }

    @Override
    public void onParticipantDisconnected(Room room, Participant participant) {
        // A participant left the Room
    }

    @Override
    public void onRecordingStarted(Room room) {
        // Notifies you that the media being shared to a room is being recorded.
    }

    @Override
    public void onRecordingStopped(Room room) {
        // Notifies you that the media being shared to a room is no longer being recorded.
    }
};

// Connect to the room
Room room = Video.connect(context, connectOptions, roomListener);
