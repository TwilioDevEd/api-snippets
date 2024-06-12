// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/list-picker
    var twilioListPicker = new TwilioListPicker.Builder();
    twilioListPicker.WithBody("Owl Air Flash Sale! Hurry! Sale ends on {{1}}!");
    var item1 = new ListPickerItems.Builder()
        .WithItem("SFO to NYC for $299")
        .WithDescription("Owl Air Flight 1337 to LGA")
        .WithId("SFO1337")
        .Build();
     var item2 = new ListPickerItems.Builder()
        .WithItem("OAK to Denver for $149")
        .WithDescription("Owl Air Flight 5280 to DEN")
        .WithId("OAK5280")
        .Build();
    var item3 = new ListPickerItems.Builder()
        .WithItem("LAX to Chicago for $199")
        .WithDescription("Owl Air Flight 96 to ORD")
        .WithId("LAX96")
        .Build();
    twilioListPicker.WithItems(new List<ListPickerItems>() { item1, item2, item3 });

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioListPicker(twilioListPicker.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_sale_list");
    contentCreateRequest.WithVariables(new Dictionary<string, string>() { {"1", "end_date"} });
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
