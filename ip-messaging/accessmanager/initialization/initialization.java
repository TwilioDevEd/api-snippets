import com.twilio.accessmanager.AccessManager;

// This listener will receive AccessManager lifecycle update callbacks
listener = new Listener; // See below for implementation

accessManager = new AccessManager(accessToken, listener);
accessManager.addTokenUpdateListener(listener);
