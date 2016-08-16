/*
 * Create a Device or update the capabilities of the current Device
 */
private void createDevice(String capabilityToken) {
    try {
        if (clientDevice == null) {
            clientDevice = Twilio.createDevice(capabilityToken, this);
​
            /*
             * Providing a PendingIntent to the newly create Device, allowing you to receive incoming calls
             *
             *  What you do when you receive the intent depends on the component you set in the Intent.
             *
             *  If you're using an Activity, you'll want to override Activity.onNewIntent()
             *  If you're using a Service, you'll want to override Service.onStartCommand().
             *  If you're using a BroadcastReceiver, override BroadcastReceiver.onReceive().
             */
​
            Intent intent = new Intent(getApplicationContext(), ClientActivity.class);
            PendingIntent pendingIntent = PendingIntent.getActivity(getApplicationContext(), 0,
                intent, PendingIntent.FLAG_UPDATE_CURRENT);
            clientDevice.setIncomingIntent(pendingIntent);
        } else {
            clientDevice.updateCapabilityToken(capabilityToken);
        }
​            
        ...
​
    } catch (Exception e) {
        Log.e(TAG, "An error has occured updating or creating a Device: \n" + e.toString());
        Toast.makeText(ClientActivity.this, "Device error", Toast.LENGTH_SHORT).show();
    }
}