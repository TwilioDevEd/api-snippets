List<Channel> channels = chatClient.getChannels().getSubscribedChannels();
for (Channel channel : channels) {
    Log.d(TAG, "Channel named: " + channel.getFriendlyName());
}
