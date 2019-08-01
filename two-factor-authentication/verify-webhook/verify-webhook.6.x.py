"""
There's no need to copy this into your codebase if you're using the official authy-python API Client
it's provided there as well: `client.one_touch.validate_one_touch_signature(signature, nonce, method, url, params)`
https://github.com/twilio/authy-python/blob/ab7f208efdae5ac30d7c5bef498a279dfdb102bd/authy/api/resources.py#L500
"""
import base64
import hashlib
import hmac
import json
import re

try:
    from urllib.parse import urlencode, quote
except ImportError:
    from urllib import urlencode, quote


def validate_authy_request(request,api_key):
    """Validates that incoming requests genuinely originated from Twilio"""
    url = request.url
    method = request.method

    # Read the Flask request parameters
    params = json.loads(request.data)

    # Convert the JSON dict to query params
    query_params = __make_http_query(params)
    sorted_params = '&'.join(sorted(query_params.replace('/', '%2F').replace('%20', '+').split('&')))
    sorted_params = re.sub("\\%5B([0-9])*\\%5D","%5B%5D",sorted_params)
    sorted_params = re.sub("\\=None", "=", sorted_params)

    # Read the nonce from the request
    nonce = request.headers['X-Authy-Signature-Nonce']

    # Concatenate all together and separate by '|'
    data = '|'.join([nonce, method, url, sorted_params])

    # Compute the signature
    computed_dig = hmac.new(
        api_key.encode(),
        msg=data.encode(),
        digestmod=hashlib.sha256
    ).digest()
    computed_sig = base64.b64encode(computed_dig)

    sig = request.headers['X-Authy-Signature']

    # Compare the message signature with your calculated signature
    # Continue processing the request if it's valid, return a 403 error if
    # it's not
    return sig == computed_sig


def __make_http_query(params, topkey=''):
    """
    Function to covert params into url encoded query string
    :param dict params: Json string sent  by Authy.
    :param string topkey: params key
    :return string: url encoded Query.
    """
    if len(params) == 0:
        return ""
    result = ""
    # is a dictionary?
    if type(params) is dict:
        for key in params.keys():
            newkey = quote(key)
            if topkey != '':
                newkey = topkey + quote('[' + key + ']')
            if type(params[key]) is dict:
                result += __make_http_query(params[key], newkey)
            elif type(params[key]) is list:
                i = 0
                for val in params[key]:
                    if type(val) is dict:
                        result +=   __make_http_query(val, newkey + quote('['+str(i)+']'))
                    else:
                        result += newkey + quote('['+str(i)+']') + "=" + quote(str(val)) + "&"
                    i = i + 1
            # boolean should have special treatment as well
            elif type(params[key]) is bool:
                result += newkey + "=" + quote(str(params[key]).lower()) + "&"
            # assume string (integers and floats work well)
            else:
                result += newkey + "=" + quote(str(params[key])) + "&"
    # remove the last '&'
    if (result) and (topkey == '') and (result[-1] == '&'):
        result = result[:-1]
    return result
