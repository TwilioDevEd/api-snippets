/* Send multiple media */

const file = await fetch("https://v.fastcdn.co/u/ed1a9b17/52533501-0-logo.svg");
const fileBlob = await file.blob();

const mediaFormData = new FormData();
mediaFormData.set("twilio-logo", fileBlob, "twilio-logo.svg");

const sendMediaOptions = {
    contentType: file.headers.get("Content-Type"),
    filename: "twilio-logo.svg",
    media: fileBlob
};

await testConversation.prepareMessage()
    .setBody("Hello!")
    // add multiple media
    .addMedia(mediaFormData)
    .addMedia(sendMediaOptions)
    // ...
    .addMedia(mediaN)
    .build()
    .send();
