import base64
import hashlib
import hmac

from django.conf import settings
from django.http import HttpResponseForbidden
from functools import wraps
try:
    from urllib.parse import urlencode
except ImportError:
    from urllib import urlencode


def validate_authy_request(f):
    """Validates that incoming requests genuinely originated from Twilio"""
    @wraps(f)
    def decorated_function(request, *args, **kwargs):
        url = request.build_absolute_uri('?')
        method = request.method
        params = getattr(request, method).items()
        sorted_params = urlencode(sorted(params))

        # Read the nonce from the request
        nonce = request.META['HTTP_X_AUTHY_SIGNATURE_NONCE']

        # Concatinate all together and separate by '|'
        data = '|'.join([nonce, method, url, sorted_params])

        # Compute the signature
        computed_dig = hmac.new(
            settings.ACCOUNT_SECURITY_API_KEY.encode('utf-8'),
            msg=data.encode('utf-8'),
            digestmod=hashlib.sha256
        ).digest()
        computed_sig = base64.b64encode(computed_dig)

        sig = request.META['HTTP_X_AUTHY_SIGNATURE']

        # Compare the message signature with your calculated signature
        # Continue processing the request if it's valid, return a 403 error if
        # it's not
        if sig == computed_sig:
            return f(request, *args, **kwargs)
        else:
            return HttpResponseForbidden()
    return decorated_function
