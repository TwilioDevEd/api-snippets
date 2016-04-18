<?php

// This line loads the library
require('Services/Twilio.php');

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new IPMessaging_Services_Twilio($sid, $token);

// Create the role
$service = $client->services->get("SERVICE_SID");
$role = $service->roles->create(array(
    'FriendlyName' => 'ROLE_NAME',
    'Type' => 'deployment',
    'Permission' => 'createChannel',
    'Permission' => 'joinChannel'
));

print $role;