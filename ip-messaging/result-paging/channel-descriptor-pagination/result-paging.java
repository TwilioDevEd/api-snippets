private void getChannelsPage(Paginator<ChannelDescriptor> paginator) {

    // Add paginator.getItems() to UI

    if (paginator.hasNextPage()) {
        paginator.requestNextPage(new CallbackListener<Paginator<ChannelDescriptor>>() {
            @Override
            public void onSuccess(Paginator<ChannelDescriptor> channelPaginator) {
                getChannelsPage(channelPaginator);
            }
        });
    }
}

// User Channels
channelsObject = myClient.getChatClient().getChannels();

// Kick first get
channelsObject.getUserChannels(new CallbackListener<Paginator<ChannelDescriptor>>() {
    @Override
    public void onSuccess(Paginator<ChannelDescriptor> channelPaginator) {
        getChannelsPage(channelPaginator);
    }
});

// Channel Members
channel.getMembers().getMembers(new CallbackListener<Paginator<Member>>() {
  @Override
  public void onSuccess(Paginator<Member> memberPaginator) {
    // use memberPaginator.getItems() in UI
  }
});