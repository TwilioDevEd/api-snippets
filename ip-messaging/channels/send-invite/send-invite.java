channel.getMembers().inviteByIdentity("Juan", new StatusListener() {
  @Override
  public void onSuccess() {
    Log.d(TAG,"User Invited!");
  }
});