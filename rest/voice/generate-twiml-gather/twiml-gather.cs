// New File: voice-gather.cshtml
@{
    // now greet the caller
    Response.ContentType = "text/xml";
}
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Say>Hello there. Thanks for calling.</Say>
    <Play>http://ia600303.us.archive.org/4/items/Wednesdy-tuesdy-ramblinSound/Wednesdy-tuesdyRamblinSound.mp3</Play>
    <Gather numDigits="1" action="handle-gather.cshtml" method="POST">
        <Say>
            To speak with a real person, press 1.  
            Press 2 to record a message for a Twilio educator.  
            Press any other key to start over.
        </Say>
    </Gather>
</Response>