private Room.Listener roomListener() {
  return new Room.Listener() {

    @Override
    public void onParticipantConnected(Room room, Participant participant) {
      Log.v(TAG, "Participant connected: " + participant.getIdentity());
    }

    @Override
    public void onParticipantDisconnected(Room room, Participant participant) {
      Log.v(TAG, "Participant disconnected: " + participant.getIdentity());
    }
  };
}

