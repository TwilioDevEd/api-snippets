<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$permissions = $client->preview->sync
                      ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                      ->syncMaps('MPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                      ->syncMapPermissions
                      ->read();

print_r($permissions);
