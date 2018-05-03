// example for sending media message as FormData
// ---------------------------------------------
const formData = new FormData();
formData.append('file', $('#formInputFile')[0].files[0]);
// get desired channel (for example, with getChannelBySid promise)
chatClient.getChannelBySid(channelSid).then(function(channel) {
  // send media with all FormData parsed atrtibutes
  channel.sendMessage(formData);
});

// example for sending media message as String
// -------------------------------------------
// get desired channel (for example, with getChannelBySid promise)
chatClient.getChannelBySid(channelSid).then(function(channel) {
  // send SVG image as string with content type image/svg+xml; charset=utf-8
  channel.sendMessage({
    contentType: 'image/svg+xml; charset=utf-8',
    media:
      '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">' +
      '<path d="M50,3l12,36h38l-30,22l11,36l-31-21l-31,21l11-36l-30-22h38z"' +
      ' fill="#FF0" stroke="#FC0" stroke-width="2"/></svg>',
  });
});

// example for sending media message as Buffer
// -------------------------------------------
// get desired channel (for example, with getChannelBySid promise)
chatClient.getChannelBySid(channelSid).then(function(channel) {
  // send PNG image as Buffer with content type image/png
  channel.sendMessage({
    contentType: 'image/png',
    media: fs.readFileSync(pngFile),
  });
});
