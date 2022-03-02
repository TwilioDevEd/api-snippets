/* Check and update Media samples */
import {Media, SendMediaOptions} from "@twilio/conversations";

// Return all media attachments, except email body/history attachments, without temporary urls
const media: Media[] = message.attachedMedia;

// Return a (possibly empty) array of media matching a specific set of categories. Allowed category is so far only 'media'
const categorizedMedia: Media[] = await message.getMediaByCategory(["media"]);

const file = await fetch("https://v.fastcdn.co/u/ed1a9b17/52533501-0-logo.svg");
const fileBlob = await file.blob();

// Send a media message
const sendMediaOptions: SendMediaOptions = {
    contentType: file.headers.get("Content-Type"),
    filename: "twilio-logo.svg",
    media: fileBlob
};

await conversation.prepareMessage().addMedia(sendMediaOptions);
