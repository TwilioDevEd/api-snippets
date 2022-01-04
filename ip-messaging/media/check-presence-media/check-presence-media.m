if (!message.attachedMedia.isEmpty) {
    for (TCHMedia *media in message.attachedMedia) {
        NSLog(@"media filename: %@ (optional)", media.filename);
        NSLog(@"media size: %ld", media.size);
    }
}
