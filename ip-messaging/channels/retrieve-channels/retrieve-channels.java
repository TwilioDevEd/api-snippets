chatClient.getChannels().getUserChannels(new CallbackListener<Paginator<Channel>>() {
  @Override
  public void onSuccess(Paginator<Channel> channelPaginator) {
    for (Channel channel : channelPaginator.getItems()) {
      Log.d(TAG, "Channel named: " + channel.getFriendlyName());
    }
  }
});