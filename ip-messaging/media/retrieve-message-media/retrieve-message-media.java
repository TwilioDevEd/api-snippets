if (message.hasMedia()) {
    Message.Media media = message.getMedia();

    String sid = media.getSid();
    String type = media.getType();
    String fn = media.getFileName();
    long size = media.getSize();

    Timber.d("This is a media message with SID "+sid+", type "+type+", name "+fn+", and size "+size);

    if (type.contentEquals("text/plain")) {
        final ByteArrayOutputStream out = new ByteArrayOutputStream();
        media.download(out, new StatusListener() {
            @Override
            public void onSuccess() {
                String content = out.toString();
                Timber.d("Downloaded media "+content);
            }

            @Override
            public void onError(ErrorInfo error) {
                Timber.e("Error downloading media");
            }
        }, new ProgressListener() {
            @Override
            public void onStarted() {
                Timber.d("Download started");
            }

            @Override
            public void onProgress(long bytes) {
                Timber.d("Downloaded "+bytes+" bytes");
            }

            @Override
            public void onCompleted(String mediaSid) {
                Timber.d("Download completed");
            }
        });
    }
}
