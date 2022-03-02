/* Checking/listening to reachability */

// check if reachability function is enabled
if (!client.reachabilityEnabled) {
    // reachability function is disabled for the client
    return;
}

// listen to user reachability status updates
client.on("userUpdated", ({ user, updateReasons}) => {
    if (updateReasons.includes("reachabilityOnline")) {
        // user reachability status was updated
    }

    if (updateReasons.includes("reachabilityNotifiable")) {
        // user notifications status was updated
    }
})

const participants = await conversation.getParticipants();

participants.forEach(async (participant) => {
    const user = await participant.getUser();

    if (user.isOnline) {
        // conversation participant is online
    }

    if (user.isNotifiable) {
        // user has push notifications active
    }
});
