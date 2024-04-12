1. In a first terminal, create a public proxy endpoint with ngrok ([learn more](https://dashboard.ngrok.com/get-started/setup/))

```bash
ngrok http http://localhost:8080
```

2. Copy the public endpoint. It should look similar to `https://a8a06a2932bc.ngrok.app`.

3. In a second terminal, start the sample server

```bash
export TWILIO_AUTH_TOKEN=<YOUR AUTH TOKEN>
export PUBLIC_URL=<YOUR URL FROM STEP 2>
mvn spring-boot:run
```

4. Create a new Webhook Sink in the [Twilio console](https://console.twilio.com/us1/develop/event-streams/sinks/new). Set the `Method` to `POST`. Set the `Destination` to the URL from step 2 followed by `/my-webhook-url`. It should look similar to `https://a8a06a2932bc.ngrok.app/my-webhook-url`.
   
5. Click `View Sink Details`

6. Click `Send test event` inside the sink view in the Twilio Console

7. You should see a message `Received event` in the second terminal