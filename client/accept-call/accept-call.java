public class ClientActivity implements DeviceListener, ConnectionListener {

    private void createDevice(String capabilityToken) {
          clientDevice = Twilio.createDevice(capabilityToken, ClientActivity.class);
          Intent intent = new Intent(getApplicationContext(), ClientActivity.class);
          PendingIntent pendingIntent = PendingIntent.getActivity(getApplicationContext(), 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);
          clientDevice.setIncomingIntent(pendingIntent);
    }

    /*
     * Receive intent for incoming call from Twilio Client Service
     * Android will only call Activity.onNewIntent() if `android:launchMode` is set to `singleTop`.
     */
    @Override
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setIntent(intent);
    }

    @Override
    public void onResume() {
        super.onResume();

        Intent intent = getIntent();

        if (intent != null) {
            /*
             * Determine if the receiving Intent has an extra for the incoming connection. If so,
             * remove it from the Intent to prevent handling it again next time the Activity is resumed
             */
            Device device = intent.getParcelableExtra(Device.EXTRA_DEVICE);
            Connection incomingConnection = intent.getParcelableExtra(Device.EXTRA_CONNECTION);

            if (incomingConnection == null && device == null) {
                return;
            }
            intent.removeExtra(Device.EXTRA_DEVICE);
            intent.removeExtra(Device.EXTRA_CONNECTION);

            // Application Specific Logic for handling an incoming Connection
            handleIncomingConnection(Device device, Connection incoming);
        }
    }


}