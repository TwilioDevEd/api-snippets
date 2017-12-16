chatClient.getChannels().getPublicChannelsList(new CallbackListener<Paginator<ChannelDescriptor>>() {
  @Override
  public void onSuccess(Paginator<ChannelDescriptor> channelPaginator) {
    for (ChannelDescriptor channel : channelPaginator.getItems()) {
      Log.d(TAG, "Channel named: " + channel.getFriendlyName());
    }
  }
});
