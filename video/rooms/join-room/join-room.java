public void connectToRoom(String roomName) {
  ConnectOptions connectOptions = new ConnectOptions.Builder()
    .roomName(roomName)
    .localMedia(localMedia)
    .build();
  room = videoClient.connect(connectOptions, this);
}

private Room.Listener roomListener() {
  return new Room.Listener() {
    @Override
    public void onConnected(Room room) {
      Log.d(TAG,"Connected to " + room.getName());
    }
  }
}