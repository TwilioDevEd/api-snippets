<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

// Place to store the billable usage
$timeToBill = 0;

// 30 days ago
$date = strtotime('-1 month');

$calls = $client
    ->calls
    ->read(
        array("startTime" => date('Y-m-d', $date))
    );

foreach ($calls as $call) {
    // Get time of call in minutes
    $timeToBill += ceil((float) $call->duration);
}

echo "Account $sid used $timeToBill minutes.";
