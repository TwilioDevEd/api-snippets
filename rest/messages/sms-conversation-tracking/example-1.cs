@{
    int counter = 0;

    // get the session varible if it exists    
    if (Session["counter"]!=null) { counter=(int)Session["counter"]; }

    // increment it
    counter++;

    // save it
    Session["counter"] = counter;

    // make an associative array of senders we know, indexed by phone number
    var people = new Dictionary<string,string>() { 
        {"+14158675309","Curious George"},
        {"+14158675310","Boots"},
        {"+14158675311","Virgil"}
    };

    // if the sender is known, then greet them by name
    // otherwise, consider them just another monkey
    string name = "Monkey";
    if (!string.IsNullOrEmpty(Request["From"]))
    {
        name = people[Request["From"]];
    }

    // output the counter response
    Response.ContentType = "text/xml";
}
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Sms>@name has messaged @Request["To"] @counter times</Sms>
</Response>