<?php

// This line loads the library
require('Services/Twilio.php');

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new IPMessaging_Services_Twilio($sid, $token);

// Retrieve the role
$service = $client->services->get("SERVICE_SID");
$role = $service->roles->get("ROLE_SID");
print $role;
