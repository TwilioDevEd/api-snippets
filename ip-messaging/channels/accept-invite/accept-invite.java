@Override
public void onChannelInvited(final Channel channel) {
    channel.join(new StatusListener() {
        @Override
        public void onSuccess() {
            Log.d(TAG, "Joined Channel: " + channel.getFriendlyName());
        }
    });
}
