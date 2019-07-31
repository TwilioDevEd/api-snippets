<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$composition = $client->video->compositions->create('RMXXXX', [
    'audioSources' => '*',
    'audioSourcesExcluded' => 'advisor-audio',
    'videoLayout' =>  array(
                        'interviewed' => array(
                            'z_pos' => 2,
                            'x_pos' => 400,
                            'y_pos' => 180,
                            'width' => 480,
                            'height' => 360,
                            'video_sources' => array('interviewed-video')
                        ),
                        'interviewers' => array(
                            'z_pos' => 1,
                            'x_pos' => 10,
                            'y_pos' => 0,
                            'width' => 1260,
                            'height' => 720,
                            'max_rows' => 3,
                            'max_columns' => 3,
                            'reuse' => 'show_newest',
                            'cells_excluded' => array(4),
                            'video_sources' => array('interviewer-*')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'resolution' => '1280x720',
    'format' => 'mp4'
]);

echo $composition->sid;
