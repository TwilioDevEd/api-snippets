// Messages messagesObject;
messagesObject.sendMessage(
    Message.options()
        .withMedia(new FileInputStream("/path/to/Somefile.txt"), "text/plain")
        .withMediaFileName("file.txt")
        .withMediaProgressListener(new ProgressListener() {
            @Override
            public void onStarted() {
                Timber.d("Upload started");
            }

            @Override
            public void onProgress(long bytes) {
                Timber.d("Uploaded " + bytes + " bytes");
            }

            @Override
            public void onCompleted(String mediaSid) {
                Timber.d("Upload completed");
            }
        }),
    new CallbackListener<Message>() {
        @Override
        public void onSuccess(Message msg) {
            Timber.d("Successfully sent MEDIA message");
        }

        @Override
        public void onError(ErrorInfo error) {
            Timber.e("Error sending MEDIA message");
        }
    });
