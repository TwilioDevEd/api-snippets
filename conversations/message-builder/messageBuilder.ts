/* Using MessageBuilder */
// Message builder. Allows the message to be built and sent via method chaining.

await testConversation.prepareMessage()
    .setBody('Hello!')
    .setAttributes({foo: 'bar'})
    .addMedia(media1)
    .addMedia(media2)
    .build()
    .send();
