func chatClient(_ client: TwilioChatClient, notificationUpdatedBadgeCount badgeCount: UInt) {
    UIApplication.shared.applicationIconBadgeNumber = Int(badgeCount)
}
