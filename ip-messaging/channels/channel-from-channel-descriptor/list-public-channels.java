channelDescriptor.getChannel(new CallbackListener<Channel>() {
    @Override
    public void onSuccess(Channel channel) {
      Log.d(TAG, "Channel Status: " + channel.getStatus());
    }
});
