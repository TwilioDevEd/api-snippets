/* Initialization */
import {Client, State} from "@twilio/conversations";

const client: Client = new Client("token");
client.on('stateChanged', (state: State) => {
    if (state === "failed") {
        // The client failed to initialize
        return;
    }

    if (state === 'initialized') {
        // Use the client
    }
});
