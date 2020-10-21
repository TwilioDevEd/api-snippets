<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

// Initialize the client
$client = new Client($sid, $token);

//Update the role
$role = $client->chat
    ->services("ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->roles("RLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->fetch();

$new_permissions = array_merge(['sendMediaMessage'], $role->permissions || []);
$role->update($new_permissions);

print $role->friendlyName;
