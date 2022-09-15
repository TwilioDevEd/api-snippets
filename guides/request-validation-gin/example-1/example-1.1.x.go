package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/client"
)

func requireValidTwilioSignature(validator *client.RequestValidator) gin.HandlerFunc {
	return func(context *gin.Context) {
		// Your url will vary depending on your environment and how your application is deployed
		// Modify this url declaration sample as necessary
		url := "https://some-digits.ngrok.io" + context.Request.URL.Path
		signatureHeader := context.Request.Header.Get("X-Twilio-Signature")
		params := make(map[string]string)
		context.Request.ParseForm()
		for key, value := range context.Request.PostForm {
			params[key] = value[0]
		}

		// Requests are validated based on the incoming url, parameters,
		// and the X-Twilio-Signature header.
		// If the request is not valid, return a 403 error
		if !validator.Validate(url, params, signatureHeader) {
			fmt.Println("Request isn't from Twilio 🚫")
			context.AbortWithStatus(http.StatusForbidden)
			return
		}
		// If the request is valid, execute the next middleware (in this case, the route handler)
		context.Next()
	}
}
