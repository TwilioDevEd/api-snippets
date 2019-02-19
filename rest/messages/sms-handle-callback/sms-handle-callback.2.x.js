const http = require('http');
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

app.post('/MessageStatus', (req, res) => {
  const messageSid = req.body.MessageSid;
  const messageStatus = req.body.MessageStatus;
  console.log('SID: ' + messageSid + ', Status: ' + messageStatus);
  res.end();
});

http.createServer(app).listen(1337, () => {
  console.log('Express server listening on port 1337');
});
