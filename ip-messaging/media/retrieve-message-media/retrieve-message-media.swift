if message.hasMedia() {
    message.getMediaContentTemporaryUrl { (result, mediaContentUrl) in
        guard let mediaContentUrl = mediaContentUrl else {
            return
        }
        // Use the url to download an image or other media
        print(mediaContentUrl)
    }
}