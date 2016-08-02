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

// New File: handle-gather.cshtml
@{
    // otherwise, if 1 was pressed we <Dial> +13105551212. If 2 
    // we make an audio recording up to 30 seconds long.
    Response.ContentType = "text/xml";
}
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    @if (Request["Digits"] == "1")
    {
        <Dial>+13105551212</Dial>
        <Say>The call failed or the remote party hung up.  Goodbye.</Say>
    } 
    else if (Request["Digits"] == "2") 
    {
        <Say>Record your message after the tone.</Say>
        <Record maxLength="30" action="handle-recording.cshtml" />
    }
    else {
        <Redirect>/</Redirect>
    }
</Response>

// New File: handle-recording.cshtml

@{
    Response.ContentType = "text/xml";
}
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Say>Listen to your recorded message.</Say>
    <Play>@Request["RecordingUrl"]</Play>
    <Say>Goodbye.</Say>
</Response>