<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($sid, $token);

$alerts = $client->monitor->alerts->read(
    array(
        "startDate" => "2015-04-01T00:00:00Z",
        "endDate" => "2015-04-30T23:59:59Z",
        "logLevel" => "warning"
    )
);

// Loop over the list of alerts and echo a property for each one
foreach ($alerts as $alert) {
    echo $alert->alertText;
}
