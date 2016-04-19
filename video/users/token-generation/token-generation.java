// Import necessary dependencies 
import com.google.gson.JsonObject;
import com.koushikdutta.async.future.FutureCallback;
import com.koushikdutta.ion.Ion;

...

    private void retrieveAccessTokenfromServer() {
        Ion.with(this)
                // Make JSON request to server
                .load("http://localhost:8080/token.php")
                .asJsonObject()
                .setCallback(new FutureCallback<JsonObject>() {
                    @Override
                    // Handle response from server
                    public void onCompleted(Exception e, JsonObject result) {
                        if (e == null) {
                            // The identity can be used to receive calls
                            String identity = result.get("identity").getAsString();
                            String accessToken = result.get("token").getAsString();
                            Log.i(TAG, "Token found: " + accessToken);
                            accessManager =
                                    TwilioAccessManagerFactory.createAccessManager(accessToken,
                                                    accessManagerListener());
                            conversationsClient =
                                    TwilioConversations
                                            .createConversationsClient(accessManager,
                                                    conversationsClientListener());

                            // Listen for incoming Invites
                            conversationsClient.listen();
                        } else {
                            Log.i(TAG, "error fetching token from server");
                            Toast.makeText(ConversationActivity.this,
                                    R.string.error_retrieving_access_token, Toast.LENGTH_SHORT)
                                    .show();
                        }
                    }
                });
    }

...
