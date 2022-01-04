[conversationsClient getTemporaryContentUrlsForMedia:message.attachedMedia completion:^(TCHResult *result, NSDictionary *mediaSidToUrlMap) {
    if (!result.isSuccessful) {
        NSLog("Cannot get temporary urls with error: %@", result.error);
        return;
    }

    for (NSString *sid in mediaSidToUrlMap) {
        NSLog(@"%@ -> %@", sid, mediaSidToUrlMap[sid]);
    }
}];
