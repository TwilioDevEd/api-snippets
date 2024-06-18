// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/call-to-action type
    var twilioCallToAction = new TwilioCallToAction.Builder();
    twilioCallToAction.WithBody("Owl Air: We will see you soon! Flight {{1}} to {{2}} departs at {{3}} from Gate {{4}}.");
    var cta1 = new CallToAction.Builder()
        .WithType(CallToActionActionType.Url)
        .WithUrl("https://owlair.com/{{5}}")
        .WithTitle("Check Flight Status")
        .Build();
    var cta2 = new CallToAction.Builder()
        .WithType(CallToActionActionType.PhoneNumber)
        .WithPhone("+15555551234")
        .WithTitle("Call Support")
        .Build();
    twilioCallToAction.WithActions(new List<CallToAction>() { cta1, cta2 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioCallToAction(twilioCallToAction.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_air_cta");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "flight_number"}, {"2", "arrival_city"}, {"3", "departure_time"}, {"4", "gate_number"}, {"5", "url_suffix"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
