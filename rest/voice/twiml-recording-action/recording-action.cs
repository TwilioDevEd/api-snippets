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