/* Handle client state change */

import {ConnectionState} from "@twilio/conversations";

client.on("connectionStateChanged", ({state}: {
    state: ConnectionState
}) => {
    // handle new connection state
});
