<?php

// This line loads the library
require('Services/Twilio.php');

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new IPMessaging_Services_Twilio($sid, $token);

// Update the service
$service = $client->services->get("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
$response = $service->update(array(
    "FriendlyName" => "NEW_FRIENDLY_NAME",
));
print $response;