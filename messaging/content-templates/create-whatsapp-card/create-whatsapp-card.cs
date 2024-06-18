// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the whatsapp/card 
    var whatsappCard = new WhatsappCard.Builder();
    whatsappCard.WithBody("Congratulations, you have reached Elite status! Add code {{1}} for 10% off.");
    whatsappCard.WithHeaderText("This is a {{1}} card");
    whatsappCard.WithFooter("To unsubscribe, reply Stop");
    var cardAction1 = new CardAction.Builder()
        .WithType(CardActionType.Url)
        .WithUrl("https://www.twilio.com")
        .WithTitle("Order Online")
        .Build();
    var cardAction2 = new CardAction.Builder()
        .WithType(CardActionType.PhoneNumber)
        .WithPhone("+15551234567")
        .WithTitle("Call Us")
        .Build();
    whatsappCard.WithActions(new List<CardAction>() { cardAction1, cardAction2 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithWhatsappCard(whatsappCard.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_coupon_code");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "coupon_code"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
