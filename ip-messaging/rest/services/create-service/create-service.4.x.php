<?php

// This line loads the library
require('Services/Twilio.php');

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new IPMessaging_Services_Twilio($sid, $token);

// Create the service
$service = $client->services->create(array(
    "FriendlyName" => "NEW_SERVICE",
));
print $service->sid;