const qs = require('qs');
const crypto = require('crypto');

/**
 * @param {http} req This is an HTTP request from the Express middleware
 * @param {!string} apiKey  Account Security API key
 * @return {Boolean} True if verified
 */
function verifyCallback(req, apiKey) {
  const url = req.protocol + '://' + req.get('host') + req.originalUrl;
  const method = req.method;
  const params = req.body;	// needs `npm i body-parser` on Express 4

  // Sort the params
  const sortedParams = qs
    .stringify(params, { arrayFormat: 'brackets' })
    .split('&')
    .sort(sortByPropertyOnly)
    .join('&')
    .replace(/%20/g, '+');

  // Read the nonce from the request
  const nonce = req.headers['x-authy-signature-nonce'];

  // concatinate all together and separate by '|'
  const data = nonce + '|' + method + '|' + url + '|' + sortedParams;

  // compute the signature
  const computedSig = crypto
    .createHmac('sha256', apiKey)
    .update(data)
    .digest('base64');

  const sig = req.headers['x-authy-signature'];

  // compare the message signature with your calculated signature
  return sig === computedSig;
}

/**
 * Sort by property only.
 *  Normal JS sort parses the entire string so a stringified array value like 'events=zzzz'
 *  would be moved after 'events=aaaa'.
 *
 *  For this approach, we split tokenize the string around the '=' value and only sort alphabetically
 *  by the property.
 *
 * @param {string} x
 * @param {string} y
 * @return {number}
 */
function sortByPropertyOnly(x, y) {
  const xx = x.split('=')[0];
  const yy = y.split('=')[0];

  if (xx < yy) {
    return -1;
  }
  if (xx > yy) {
    return 1;
  }
  return 0;
}
