import com.twilio.accessmanager.AccessManager;

// This listener will receive AccessManager lifecycle update callbacks
listener = new Listener; // See below for implementation

// Listener we specify in the constructor is for token lifecycle events
// (onTokenWillExpire, onTokenExpired, onError)
accessManager = new AccessManager(accessToken, listener);
// Listener we specify with the additional call is for token update events
// (onTokenUpdated) - use this listener to update tokens on Twilio client(s)
accessManager.addTokenUpdateListener(listener);
