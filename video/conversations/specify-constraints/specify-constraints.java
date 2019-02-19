// See the "Create a Conversation" guide for for details of the ConversationCallback
...
  outgoingInvite = conversationsClient
    .sendConversationInvite(participants,
                            setupLocalMedia(),
                            new ConversationCallback() {
  ...

  };


private CameraCapturer cameraCapturer;

// Create LocalMedia with a camera track and no microphone track
private LocalMedia setupLocalMedia() {
  LocalMedia localMedia = new LocalMedia(localMediaListener());
  LocalVideoTrack localVideoTrack = new LocalVideoTrack(cameraCapturer);
  localMedia.addLocalVideoTrack(localVideoTrack);
  return localMedia;
}

// LocalMedia listener
private LocalMedia.Listener localMediaListener(){
  return new LocalMedia.Listener() {
    @Override
    public void onLocalVideoTrackAdded(Conversation conversation,
                                       LocalVideoTrack localVideoTrack) {
      // Attach Camera track to renderer...
    }
    ...
  };
}
