func conversationsClient(_ client: TwilioConversationsClient, notificationUpdatedBadgeCount badgeCount: UInt) {
    UIApplication.shared.applicationIconBadgeNumber = Int(badgeCount)
}
