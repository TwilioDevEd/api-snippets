if (message.hasMedia()) {
    message.getMediaContentTemporaryUrl(new CallbackListener<String>() {
        @Override
        public void onSuccess(String mediaContentUrl) {
            Log.d("TAG", mediaContentUrl);
        }
    });
}