<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
$apiKeySid = "SKXXXX";
$apiKeySecret = "your_auth_apiKeySecret";
$client = new Client($apiKeySid, $apiKeySecret);

$compositionHook = $client->video->compositionHooks->create([
    'friendlyName' => 'MyHookWithComplexVideoLayout',
    'audioSources' => array('MTAAAA', 'soundtrack'),
    'videoLayout' =>  array(
                        'main' => array (
                          'z_pos' => 1,
                          'video_sources' => array('screen-presentation')
                        ),
                        'pip' => array(
                          'z_pos' => 2,
                          'x_pos' => 1000,
                          'y_pos' => 30,
                          'width' => 240,
                          'height' => 180,
                          'video_sources' => array('MTBBBB')
                        )
                      ),
    'statusCallback' => 'http://my.server.org/callbacks',
    'resolution' => '1280x720',
    'format' => 'mp4'
]);

echo $compositionHook->sid;
