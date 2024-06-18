// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/text type for less rich channels (e.g. SMS)
    var twilioText = new TwilioText.Builder();
    twilioText.WithBody("Hi {{1}}.  Thanks for contacting Owl Air Support. How can we help?");

    // define the twilio/quick-reply type for more rich channels
    var twilioQuickReply = new TwilioQuickReply.Builder();
    twilioQuickReply.WithBody("Owl Air Support");
    var quickreply1 = new QuickReplyAction.Builder()
        .WithTitle("Contact Us")
        .WithId("flightid1")
        .Build();
    var quickreply2 = new QuickReplyAction.Builder()
        .WithTitle("Check gate number")
        .WithId("gateid1")
        .Build();
    var quickreply3 = new QuickReplyAction.Builder()
        .WithTitle("Speak with an agent")
        .WithId("agentid1")
        .Build();
    twilioQuickReply.WithActions(new List<QuickReplyAction>() { quickreply1, quickreply2, quickreply3 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioText(twilioText.Build());
    types.WithTwilioQuickReply(twilioQuickReply.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_air_qr");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "John"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
