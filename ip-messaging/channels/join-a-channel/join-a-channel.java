private void joinChannel(final Channel channel) {
    Log.d(TAG, "Joining Channel: " + channel.getUniqueName());
    channel.join(new StatusListener() {
        @Override
        public void onSuccess() {
            Log.d(TAG, "Joined channel");
        }

        @Override
        public void onError(ErrorInfo errorInfo) {
            Log.e(TAG,"Error joining channel: " + errorInfo.toString());
        }
    });
}