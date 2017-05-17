<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$permission = $client->preview->sync
                     ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                     ->syncLists('ESXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                     ->syncListPermissions('bob')
                     ->fetch();

print_r($permission);
