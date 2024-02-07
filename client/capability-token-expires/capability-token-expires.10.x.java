String token = new ClientCapability.Builder(ACCOUNT_SID, AUTH_TOKEN).ttl(600).build().toJwt();
