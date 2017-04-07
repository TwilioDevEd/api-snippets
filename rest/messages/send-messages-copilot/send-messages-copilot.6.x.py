from twilio.rest import Client

# put your own credentials here
account_sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
auth_token = "[AuthToken]"

client = Client(account_sid, auth_token)

client.messages.create(
    to="+441632960675",
    messaging_service_sid="MG9752274e9e519418a7406176694466fa",
    body="Phantom Menace was clearly the best of the prequel trilogy.")
