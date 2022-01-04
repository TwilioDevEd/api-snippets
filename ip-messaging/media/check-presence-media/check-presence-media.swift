if (!message.attachedMedia.isEmpty) {
    for media in message.attachedMedia {
        print("media filename: \(String(describing: media.filename)) (optional)")
        print("media size: \(media.size)")
    }
}
