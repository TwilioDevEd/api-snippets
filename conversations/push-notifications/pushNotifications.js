/* Receiving and handling a push notification */

/* push registration. arguments:
 @channelType -  "apn" or "fcm"
 @registrationId - can be retrieved from the firebase
 */
await client.setPushRegistrationId(channelType, registrationId);

// remove push registration
await client.removePushRegistrations(channelType, registrationId);

// handle push notification payload parsing and emit the Client.pushNotification event on this Client instance
await client.handlePushNotification(notificationPayload);

client.on("pushNotification", (pushNotification) => {
    // pushNotification was received by the client
});

// static method for push notification payload parsing
const pushNotification = Client.parsePushNotification(notificationPayload);
