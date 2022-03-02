/* Initialization */
import {Client} from "@twilio/conversations";

const client = new Client("token");
client.on("stateChanged", (state) => {
    if (state === "failed") {
        // The client failed to initialize
        return;
    }

    if (state === "initialized") {
        // Use the client
    }
});
