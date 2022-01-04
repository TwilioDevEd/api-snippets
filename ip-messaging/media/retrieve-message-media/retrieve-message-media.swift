conversationsClient.getTemporaryContentUrlsForMedia(message.attachedMedia) { result, mediaSidToUrlMap in
    guard result.isSuccessful else {
        print("Couldn't get temporary urls with error: \(String(describing: result.error))")
        return
    }

    for (sid, url) in sidToUrlMap {
        print("\(sid) -> \(url)")
    }
}
