- (void)chatClient:(TwilioChatClient *)client notificationUpdatedBadgeCount:(NSUInteger)badgeCount {
    [UIApplication.currentApplication setApplicationIconBadgeNumber:badgeCount];
}
