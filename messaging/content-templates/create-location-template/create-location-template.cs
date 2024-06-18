// Install the C# / .NET helper library from twilio.com/docs/csharp/install

using System;
using Twilio;
using Twilio.Rest.Content.V1;

     TwilioClient.Init(accountSid, authToken);

    // define the twilio/text
    var twilioText = new TwilioText.Builder();
    twilioText.WithBody("Owl Air: Time to board, SFO is located at San Francisco International Airport, P.O. Box 8097, San Francisco, CA 94128 ");

    // define the twilio/location
    var twilioLocation = new TwilioLocation.Builder();
    twilioLocation.WithLabel("Time to Board @ SFO");
    twilioLocaiton.WithLatitude(37.62159755922449)
    twilioLocaiton.WithLongitude(-122.37888566473057)

    // define all the content types to be part of the template
    var types = new Types.Builder();
    types.WithTwilioText(twilioText.Build());
    types.WithTwilioLocation(twilioLocation.Build());

    // build the create request object
    var contentCreateRequest = new ContentCreateRequest.Builder();
    contentCreateRequest.WithTypes(types.Build());
    contentCreateRequest.WithLanguage("en");
    contentCreateRequest.WithFriendlyName("owl_air_location");
    
    // create the twilio template
    var contentTemplate = await CreateAsync(contentCreateRequest.Build());

    Console.WriteLine($"Created Twilio Content Template SID: {contentTemplate.Sid}");
