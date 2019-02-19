const ipmGrant = new IpMessagingGrant({
  serviceSid: process.env.TWILIO_IPM_SERVICE_SID,
  endpointId: endpointId,
  pushCredentialSid: 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
});
