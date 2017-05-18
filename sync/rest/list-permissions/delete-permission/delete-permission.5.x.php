<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$status = $client->preview->sync
                 ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 ->syncLists('MyFirstList')
                 ->syncListPermissions('bob')
                 ->delete();

print_r($status);
