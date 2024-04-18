<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Response;
use Twilio\Security\RequestValidator;

class TwilioRequestValidator
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
      if (env('APP_ENV') === 'test') {
        return $next($request);
      }

      // Be sure TWILIO_AUTH_TOKEN is set in your .env file.
      // You can get your authentication token in your twilio console https://www.twilio.com/console
      $requestValidator = new RequestValidator(env('TWILIO_AUTH_TOKEN'));

      $isValid = $requestValidator->validate(
        $request->header('X-Twilio-Signature'),
        $request->fullUrl(),
        $request->toArray()
      );

      if ($isValid) {
        return $next($request);
      } else {
        return new Response('You are not Twilio :(', 403);
      }
    }
}
