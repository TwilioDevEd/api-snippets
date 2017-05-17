<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$document = $client->preview->sync
                   ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                   ->documents('ETXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                   ->documentPermissions('bob')
                   ->fetch();

print_r($document);
