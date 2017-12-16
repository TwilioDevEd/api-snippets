<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$permissions = $client->sync
    ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
    ->syncLists('MyFirstList')
    ->syncListPermissions
    ->read();

print_r($permissions);
