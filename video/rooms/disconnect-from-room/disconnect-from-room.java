// To disconnect from a Room, we call:
room.disconnect();

// This results in a call to Room.Listener#onDisconnected
private Room.Listener roomListener() {
  return new Room.Listener() {
    @Override
    public void onDisconnected(Room room, TwilioException e) {
        Log.d(TAG,"Disconnected from " + room.getName());
    } 
  };
}
