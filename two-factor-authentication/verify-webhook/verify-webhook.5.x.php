<?php

function verifyWebhook($apiKey) {
    // Read the nonce from the request
    $nonce = $_SERVER['x-authy-signature-nonce'];
    $method = $_SERVER['REQUEST_METHOD'];
    $proto = isset($_SERVER['HTTPS']) ? "https" : "http";
    $url = "{$proto}://{$_SERVER[HTTP_HOST]}{$_SERVER[REQUEST_URI]}";
    $params = implode('&', array_map(function($k, $v) {
        return "$k=$v";
    }, array_keys($_POST), array_values($_POST)));
    sort($params);

    // concatenate all together and separate them by '|'
    $data = "$nonce|$method|$url|$params";

    // compute the signature
    $computedSig = base64_encode(hash_hmac('sha256', $data, $apiKey, true));

    // get the authy signature
    $sig = $_SERVER['x-authy-signature'];

    // compare the message signature with your calculated signature
    return hash_equals($computedSig, $sig);
}
