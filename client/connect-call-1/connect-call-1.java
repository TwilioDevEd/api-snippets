private void connect() {
    if (clientDevice != null) {
        // Create an outgoing connection
        connection = clientDevice.connect();
    } else {
        Toast.makeText(ClientActivity.this, "No existing device", Toast.LENGTH_SHORT).show();
    }
}