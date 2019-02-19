private void retrieveAccessTokenfromServer() {
    String deviceId = Settings.Secure.getString(getContentResolver(), Settings.Secure.ANDROID_ID);
    String tokenURL = SERVER_TOKEN_URL + "?device=" + deviceId;

    Ion.with(this)
            .load(tokenURL)
            .asJsonObject()
            .setCallback(new FutureCallback<JsonObject>() {
                @Override
                public void onCompleted(Exception e, JsonObject result) {
                    if (e == null) {
                        String identity = result.get("identity").getAsString();
                        String accessToken = result.get("token").getAsString();
                    } else {
                        Toast.makeText(MainActivity.this,
                                R.string.error_retrieving_access_token, Toast.LENGTH_SHORT)
                                .show();
                    }
                }
            });
}