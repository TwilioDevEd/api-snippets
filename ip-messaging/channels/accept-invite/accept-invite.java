@Override
public void onChannelAdd(final Channel channel) {
    if (channel.getStatus() == Channel.ChannelStatus.INVITED) {
        channel.join(new StatusListener() {
            @Override
            public void onSuccess() {
                Log.d(TAG, "Joined Channel: " + channel.getFriendlyName());
            }
        });
    }
}
