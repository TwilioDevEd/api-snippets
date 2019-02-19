private void connect(String contact, boolean isPhoneNumber) {
    ...

    Map<String, String> params = new HashMap<String, String>();
    params.put("To", contact);

    if (clientDevice != null) {
        // Create an outgoing connection
        connection = clientDevice.connect(params, this);
        setCallUI();
    } else {
        Toast.makeText(ClientActivity.this, "No existing device", Toast.LENGTH_SHORT).show();
    }
}