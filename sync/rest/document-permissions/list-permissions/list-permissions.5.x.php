<?php
require_once __DIR__ . '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

$accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$authToken = 'your_auth_token';

$client = new Client($accountSid, $authToken);
$documents = $client->sync
                    ->services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
                    ->documents('MyFirstDocument')
                    ->documentPermissions
                    ->read();

print_r($documents);
