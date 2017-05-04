<?php

// This line loads the library
require('Services/Twilio.php');

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";

// Initialize the client
$client = new IPMessaging_Services_Twilio($sid, $token);

// Retrieve the Credential
$credential = $client->credentials->get("CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

// Update the credential
$response = $credential->update(
    array("Type" => "NEW_TYPE")
);
print $response;
