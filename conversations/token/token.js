/* Handling token expiration/expiration warning events */

client.on("tokenAboutToExpire", (time) => {
    // token is about to expire. get a new token
    try {
        const token = (await fetch("https://placekitten.com/getToken?username=username&password=password")).data();
    } catch {
        return Error("Unable to get a token");
    }

    // update the client with new token
    client = await client.updateToken(token);

    // use updated client
});

client.on("tokenExpired", () => {
    // get a new token
    try {
        const token = (await fetch("https://placekitten.com/getToken?username=username&password=password")).data();
    } catch {
        return Error("Unable to get a token");
    }

    // token expired. create a new client
    client = new Client(token);
});

// update the token used by the client and re-register with the Conversations services
await client.updateToken("token");
