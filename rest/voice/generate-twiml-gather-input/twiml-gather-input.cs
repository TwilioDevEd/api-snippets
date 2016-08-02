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