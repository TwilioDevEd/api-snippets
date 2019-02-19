public void connectToRoom(String roomName) {
  ConnectOptions connectOptions = new ConnectOptions.Builder(accessToken)
    .roomName(roomName)
    .audioTracks(localAudioTracks)
    .videoTracks(localVideoTracks)
    .build();
  room = Video.connect(context, connectOptions, this);
}

private Room.Listener roomListener() {
  return new Room.Listener() {
    @Override
    public void onConnected(Room room) {
      Log.d(TAG,"Connected to " + room.getName());
    }
  }
}
