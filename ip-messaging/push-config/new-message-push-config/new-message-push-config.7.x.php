<?php
// This line loads the Twilio PHP Library using Composer
include('vendor/autoload.php');

// Find your Account Sid at https://www.twilio.com/console/account/settings
$TWILIO_ACCOUNT_SID = "YOUR_ACCOUNT_SID";

// Create an API Key and Secret at https://www.twilio.com/console/chat/dev-tools/api-keys
$TWILIO_API_KEY = "YOUR_API_KEY";
// To set up environmental variables, see http://twil.io/secure
$TWILIO_API_SECRET = getenv('TWILIO_API_KEY_SECRET');

// Your Chat Service SID from https://www.twilio.com/console/chat/services
$CHAT_SERVICE_SID = "YOUR_CHAT_SERVICE_SID";

// Authenticate with Twilio
$client = new Twilio\Rest\Client($TWILIO_API_KEY, $TWILIO_API_SECRET, $TWILIO_ACCOUNT_SID);

// Update the service webhooks
$service = $client->chat->v2->services($CHAT_SERVICE_SID);
$response = $service->update(array(
    "Notifications.NewMessage.Enabled" => "true",
    "Notifications.NewMessage.Template" => 'A New message in ${CHANNEL} from ${USER}: ${MESSAGE}',
    "Notifications.NewMessage.Sound" => "default",
));
