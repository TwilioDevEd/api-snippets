private void disconnect() {
    if (activeConnection != null) {
        activeConnection.disconnect();
        activeConnection = null;
    }
}