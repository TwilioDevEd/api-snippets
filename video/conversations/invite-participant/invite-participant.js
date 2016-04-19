conversation.invite('charles').then(function(participant) {
    console.log("Remote participant accepted your Invite: "  participant.identity);
}, function(error) {
    console.log("Remote participant did not connect: "  participant.identity);
});