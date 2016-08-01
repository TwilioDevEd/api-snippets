<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC2e4e4f0260f05ed5b45049894be0ed2d";
$token = "3512db0fac01b496dc7c4089356cf84b";
$client = new Client($sid, $token);

$credential = $client->notifications->credentials()
    ->getContext("CRxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
    ->update(
        array("friendlyName" => "MyCredential")
    );

echo $credential->friendlyName;
