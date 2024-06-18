// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/media type 
    var twilioMedia = new TwilioMedia.Builder();
    twilioMedia.WithBody("Thank you for your order {{1}}");
    var media1 = new Media.Builder()
        .WithMedia("https://twilio-cms-prod.s3.amazonaws.com/images/library-logo-resource2x.width-1000.png")
        .Build();
    twilioMedia.WithMedia(new List<Media>() { media1 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioMedia(twilioMedia.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("media_template");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "OrderNumber"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
