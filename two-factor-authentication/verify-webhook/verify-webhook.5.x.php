<?php
/**
 *
 * Verify Authy signature
 *
 * @param    string  $apiKey Authy PRODUCTION API KEY
 * @return   mixed - array of data from Twilio/Authy or false if verify fails
 *
 */
function verifyWebhook($apiKey)
{
    // Read the nonce, method and URL from the request
    $nonce  = !empty($_SERVER['HTTP_X_AUTHY_SIGNATURE_NONCE']) ? $_SERVER['HTTP_X_AUTHY_SIGNATURE_NONCE']
            : '';
    $method = $_SERVER['REQUEST_METHOD'];
    $scheme = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https' : 'http';
    $url = "$scheme://{$_SERVER['HTTP_HOST']}{$_SERVER['REQUEST_URI']}";

    // Get the POSTed data
    $json    = file_get_contents('php://input');
    $decoded = json_decode($json, true);

    // Flatten, sort and concatenate the decoded data
    // Ref: https://www.twilio.com/docs/authy/validation?code-sample=code-sort-the-parameters
    $flattened = [];
    flatten($decoded, '', $flattened);
    sort($flattened);
    $params = implode('&', $flattened);

    // Concatenate all together and separate them by '|'
    $data = "$nonce|$method|$url|$params";

    // Compute the signature
    $computedSig = base64_encode(hash_hmac('sha256', $data, $apiKey, true));

    // Get the authy signature, if set, otherwise use an empty string
    $sig = !empty($_SERVER['HTTP_X_AUTHY_SIGNATURE']) ? $_SERVER['HTTP_X_AUTHY_SIGNATURE']
            : '';

    // Compare the message signature with you calculated signature
    return hash_equals($sig, $computedSig) ? $decoded : false;
}

/*
 * Flatten data into an array of strings.  Each string is a key/value pair, URL encoded, with booleans converted to strings
 *
 * @param array $array data sent from Twilio/Authy
 * @param string $key array index, used to support nested elements
 * @param array $flattened - flattened array
 *
 * @return array - flattened array, URL encoded, booleans normalized into strings
 *
 * This code courtesy of Game Creek Video https://www.gamecreekvideo.com
 */

function flatten($array, $key, &$flattened)
{
    foreach ($array as $k => $value) {
        $fkey = ($key === '') ? $k : $key.'['.$k.']';
        if (is_array($value)) {
            flatten($value, $fkey, $flattened);
        } else {
            if (is_bool($value)) {
                $value = $value === true ? 'true' : 'false';
            }
            $flattened[] = urlencode($fkey).'='.urlencode($value);
        }
    }
    return $flattened;
}
