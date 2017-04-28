<?php

// This line loads the library
require '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACCOUNT_SID";
$token = "AUTH_TOKEN";

// Initialize the client
$client = new Client($sid, $token);

// List the Credentials
$credentials = $client->chat->credentials->read();

foreach ($credentials as $credential) {
    print $credential->friendlyName;
}
