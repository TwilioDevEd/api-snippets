// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the whatsapp/authentication type
    var whatsappAuthentication = new WhatsappAuthentication.Builder();
    var auth1 = new WhatsappAuthAction.Builder()
        .WithType(WhatsappAuthActionType.CopyCode)
        .WithCopyCodeText("Check Flight Status")
        .Build();
    whatsappAuthentication.WithActions(new List<WhatsappAuthAction>() { auth1 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithWhatsappAuthentication(whatsappAuthentication.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("whatsapp_otp");
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
