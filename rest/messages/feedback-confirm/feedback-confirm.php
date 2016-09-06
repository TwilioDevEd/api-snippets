<?php
// Required if your envrionment does not handle autoloading
require __DIR__ . '/vendor/autoload.php';

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

$uniqueId = $_REQUEST['id'];
// Lookup variable `$uniqueId` in a database to find messageSid
$messageSid = 'SMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

// Your Account SID and Auth Token from twilio.com/console
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$client->request(
    'POST',
    "https://api.twilio.com/2010-04-01/Accounts/{$accountSid}/Messages/{$messageSid}/Feedback",
    null,
    array('Outcome' => 'confirmed')
);

echo 'Thank you!';

