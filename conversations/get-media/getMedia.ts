/* Check and update Media samples */
import {Media, SendMediaOptions} from "@twilio/conversations";

// Return all media attachments, without temporary urls
const media: Media[] = message.attachedMedia;

// Return a (possibly empty) array of media matching a specific set of categories. Allowed category is so far only 'media'
const categorizedMedia: Media[] = await message.getMediaByCategory(["media"]);

const mediaUrl: string = await categorizedMedia[0].getContentTemporaryUrl();
