/* Get participants of the conversation */

import {Participant} from "@twilio/conversations";

let participants: Participant[] = await conversation.getParticipants();
