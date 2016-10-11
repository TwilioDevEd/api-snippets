AccessManager accessManager = new AccessManager(context, accessToken, new AccessManager.Listener() {
    @Override
    public void onTokenExpired(AccessManager accessManager) {
        // Notifies you that the token is expiring
    }

    @Override
    public void onTokenUpdated(AccessManager accessManager) {
        // Notifies you that the access token has been updated
    }

    @Override
    public void onError(AccessManager accessManager, String error) {
        // Notifies you when an access token related error arises
    }
});

VideoClient videoClient = new VideoClient(context, accessManager);
