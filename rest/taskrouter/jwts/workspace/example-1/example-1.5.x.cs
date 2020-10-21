// Download the twilio-csharp library from
// https://www.twilio.com/docs/libraries/csharp#installation
using System;
using System.Collections.Generic;
using Twilio.Http;
using Twilio.Jwt.Taskrouter;

class Example
{
    static void Main(string[] args)
    {
        // Find your Account Sid and Auth Token at twilio.com/console
        // To set up environmental variables, see http://twil.io/secure
        const string accountSid = Environment.GetEnvironmentVariable("TWILIO_ACCOUNT_SID");
        const string authToken = Environment.GetEnvironmentVariable("TWILIO_AUTH_TOKEN");
        const string workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

        var urls = new PolicyUrlUtils(workspaceSid);

        var allowFetchSubresources = new Policy($"{urls.Workspace}/**", HttpMethod.Get);
        var allowUpdatesSubresources = new Policy($"{urls.Workspace}/**", HttpMethod.Post);
        var allowDeleteSubresources = new Policy($"{urls.Workspace}/**", HttpMethod.Delete);


        var policies = new List<Policy>
        {
            allowFetchSubresources,
            allowUpdatesSubresources,
            allowUpdatesSubresources
        };

        // By default, tokens are good for one hour.
        // Override this default timeout by specifiying a new value (in seconds).
        // For example, to generate a token good for 8 hours:
        var capability = new TaskRouterCapability(
            accountSid,
            authToken,
            workspaceSid,
            null,
            policies: policies,
            expiration: DateTime.UtcNow.AddSeconds(28800)); // 60 * 60 * 8

        Console.WriteLine(capability.ToJwt());
    }
}

class PolicyUrlUtils
{
    const string taskRouterBaseUrl = "https://taskrouter.twilio.com";
    const string taskRouterVersion = "v1";

    readonly string _workspaceSid;

    public PolicyUrlUtils(string workspaceSid)
    {
        _workspaceSid = workspaceSid;
    }

    public string Workspace =>
        $"{taskRouterBaseUrl}/{taskRouterVersion}/Workspaces/{_workspaceSid}";
}
