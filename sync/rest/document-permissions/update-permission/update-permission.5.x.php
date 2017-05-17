<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$status = $client->preview->sync
                 ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 ->documents('ETXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                 ->documentPermissions('bob')
                 ->update($read = true, $write = true, $manage = true);

print_r($status);
