- (void)conversationsClient:(TwilioConversationsClient *)client notificationUpdatedBadgeCount:(NSUInteger)badgeCount {
    [UIApplication.currentApplication setApplicationIconBadgeNumber:badgeCount];
}
