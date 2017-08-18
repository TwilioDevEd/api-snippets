from twilio.rest import TwilioRestClient

# put your own credentials here
ACCOUNT_SID = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
AUTH_TOKEN = "[AuthToken]"

client = TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN)

client.messages.create(
    to="+441632960675",
    messaging_service_sid="MG9752274e9e519418a7406176694466fa",
    body="Phantom Menace was clearly the best of the prequel trilogy.",
)
