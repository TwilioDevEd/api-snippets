// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/text type for less rich channels (e.g. SMS)
    var twilioText = new TwilioText.Builder();
    twilioText.WithBody("Hi {{1}}.  Thanks for contacting Owl Air Support. How can we help?");

    // define the twilio/card type for more rich channels
    var twilioCard = new TwilioCard.Builder();
    twilioCard.WithTitle("Owl Air Support");
    var cardAction1 = new CardAction.Builder()
        .WithType(CardActionType.Url)
        .WithUrl("https://www.twilio.com")
        .WithTitle("Contact Us")
        .Build();
    twilioCard.WithActions(new List<CardAction>() { cardAction1 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioText(twilioText.Build());
    types.WithTwilioCard(twilioCard.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_air_card");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "John"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
