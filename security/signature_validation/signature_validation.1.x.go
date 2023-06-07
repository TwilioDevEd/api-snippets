package main

import (
	"fmt"
	"os"

	"github.com/twilio/twilio-go/client"
)

func main() {
	// Your Auth Token from twilio.com/console
	authToken := os.Getenv("TWILIO_AUTH_TOKEN")

	// Initialize the request validator
	requestValidator := client.NewRequestValidator(authToken)

	// Store Twilio's request URL (the url of your webhook) as a variable
	url := "https://example.com/myapp"

	// Store the application/x-www-form-urlencoded params from Twilio's request as a variable
	// In practice, this MUST include all received parameters, not a
	// hardcoded list of parameters that you receive today. New parameters
	// may be added without notice.
	params := map[string]string{
		"CallSid": "CA1234567890ABCDE",
		"Caller":  "+12349013030",
		"Digits":  "1234",
		"From":    "+12349013030",
		"To":      "+18005551212",
	}

	// Store the X-Twilio-Signature header attached to the request as a variable
	signature := "Np1nax6uFoY6qpfT5l9jWwJeit0="

	// Check if the incoming signature is valid for your application URL and the incoming parameters
	fmt.Println(requestValidator.Validate(url, params, signature))
}
