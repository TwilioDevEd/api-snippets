private static final String TOKEN_SERVICE_URL = "https://your.server.name/token";

Ion.with(getApplicationContext())
        .load(TOKEN_SERVICE_URL)
        .asString()
        .setCallback(new FutureCallback<String>() {
            @Override
            public void onCompleted(Exception e, String capabilityToken) {
                if (e == null) {
                    Log.d(TAG, capabilityToken);

                    // TODO: Use capabilityToken
                } else {
                    Log.e(TAG, "Error retrieving token: " + e.toString());
                    Toast.makeText(ClientActivity.this, "Error retrieving token", Toast.LENGTH_SHORT).show();
                }
            }
        });