<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Get your Account SID and Auth Token from https://twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($accountSid, $authToken);

$fleetSid = 'FLXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$fleetService = $client->preview->deployedDevices->fleets($fleetSid);

$key = $fleetService->keys('KYXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')->update(
  array(
    'friendlyName' => 'My New Device Key',
    'deviceSid' => 'THXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
));

echo $key->deviceSid;
