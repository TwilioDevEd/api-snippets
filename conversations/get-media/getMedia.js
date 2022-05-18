/* Check and update Media samples */

// Return all media attachments, without temporary urls
const media = message.attachedMedia;

// Return a (possibly empty) array of media matching a specific set of categories. Allowed category is so far only 'media'
const categorizedMedia = await message.getMediaByCategory(["media"]);

//Get a temporary URL for the first media returned by the previous method
const mediaUrl = await categorizedMedia[0].getContentTemporaryUrl();
