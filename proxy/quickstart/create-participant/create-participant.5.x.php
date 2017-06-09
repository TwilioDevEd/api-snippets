<?php
// NOTE: This example uses the ALPHA release of the next generation Twilio
// helper library - for more information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php#accessing-preview-twilio-features

// This line loads the library
require './vendor/autoload.php';
use Twilio\Rest\Client;
// Find your Account Sid and Token at twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
// Initialize the client
$client = new Client($sid, $token);
$session = $client
    ->preview
    ->proxy
    ->services("KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->sessions("KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    ->participants->create(
        array(
            "identifier" => "+15558675309",
            "friendlyName" => "Alice"
        )
    );

echo $session->sid;
