<?php
// Get the Node helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Get your Account SID and Auth Token from https://twilio.com/console
$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';
$client = new Client($accountSid, $authToken);

$fleetSid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$fleetService = $client->preview->deployedDevices->fleets($fleetSid);

$key = $fleetService->keys('KYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')->update(
  array(
    'friendlyName' => 'My New Device Key',
    'deviceSid' => 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
));

echo $key->deviceSid;
