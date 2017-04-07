var grant = new IpMessagingGrant();
grant.EndpointId = $"TwilioChatDemo:{identity}:{device}";
grant.ServiceSid = ipmServiceSid;
grant.PushCredentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";