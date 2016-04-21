from twilio.rest import TwilioRestClient 
 
# put your own credentials here 
ACCOUNT_SID = "AC5ef872f6da5a21de157d80997a64bd33" 
AUTH_TOKEN = "[AuthToken]" 
 
client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN) 
 
client.messages.create(
    to="+16518675309", 
    messaging_service_sid="MG9752274e9e519418a7406176694466fa", 
    body="Phantom Menace was clearly the best of the prequel trilogy.",
)