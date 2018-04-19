<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

$uniqueId = $_REQUEST['id'];
// Lookup variable `$uniqueId` in a database to find messageSid
$messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

// Your Account SID and Auth Token from twilio.com/console
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$client->messages($messageSid)->feedback->create(
    array("outcome" => "confirmed")
);

echo 'Thank you!';

