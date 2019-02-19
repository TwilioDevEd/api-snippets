<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$composition = $client->video->compositions->create([
    'roomSid' => 'RMXXXX',
    'audioSources' => '*',
    'videoLayout' =>  array(
                        'chess_table' => array(
                            'x_pos' => 10,
                            'y_pos' => 0,
                            'width' => 1260,
                            'height' => 720,
                            'max_rows' => 3,
                            'max_columns' => 3,
                            'reuse' => 'show_newest',
                            'cells_excluded' => array(1,3,5,7),
                            'video_sources' => array('*')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'resolution' => '1280x720',
    'format' => 'mp4'
]);

echo $composition->sid;
