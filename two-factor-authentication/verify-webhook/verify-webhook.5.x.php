<?php
/**
 *
 * Verify Authy signature
 *
 * @param    string  $apiKey Authy app API KEY
 * @return   bool
 *
 */
function verifyWebhook($apiKey) {
    // Read the nonce from the request
    $nonce = $_SERVER['HTTP_X_AUTHY_SIGNATURE_NONCE'];
    $method = $_SERVER['REQUEST_METHOD'];
    $proto = isset($_SERVER['HTTPS']) ? "https" : "http";
    $url = "{$proto}://{$_SERVER[HTTP_HOST]}{$_SERVER[REQUEST_URI]}";

    // get the Json string sent by Authy
    $json = file_get_contents('php://input');
    $decoded = json_decode($json, true);
    $normalized = normalizeArray($decoded);

    //  sort the parameters by keys
    $query = http_build_query($normalized);
    $exploded = explode('&', $query);
    sort($exploded);
    $params = implode('&', $exploded);

    // concatenate all together and separate them by '|'
    $data = "$nonce|$method|$url|$params";

    // compute the signature
    $computedSig = base64_encode(hash_hmac('sha256', $data, $apiKey, true));

    // get the authy signature
    $sig = $_SERVER['HTTP_X_AUTHY_SIGNATURE'];

    // compare the message signature with your calculated signature
    return hash_equals($computedSig, $sig);
}

/**
 *
 * Replace boolean values with strings.
 *   In PHP methods like http_build_query converts values from an array
 *   to 0 and 1 integers instead of 'false' and 'true'.
 *
 * @param    array  $array Multidimensional array with boolean values
 * @return   array
 *
 */
function normalizeArray($array) {
  foreach ($array as &$el) {
      if (is_bool($el)) {
        $el = ($el) ? "true" : "false";
      } elseif (is_array($el)) {
        $el = normalizeArray($el);
      }
  }
  return $array;
}
