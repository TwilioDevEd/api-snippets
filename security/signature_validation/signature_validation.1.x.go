package main

import (
	"fmt"
	"os"

	"github.com/twilio/twilio-go/client"
)

func main() {
	// You can find your Auth Token at twilio.com/console
	// For this example: authToken := "12345"
	authToken := os.Getenv("TWILIO_AUTH_TOKEN")

	requestValidator := client.NewRequestValidator(authToken)

	// Twilio's request URL
	url := "https://mycompany.com/myapp.php?foo=1&bar=2"

	// Post variables in Twilio's request
	params := map[string]string{
		"CallSid": "CA1234567890ABCDE",
		"Caller":  "+12349013030",
		"Digits":  "1234",
		"From":    "+12349013030",
		"To":      "+18005551212",
	}

	// X-Twilio-Signature header attached to the request
	signature := "0/KCTR6DLpKmkAf8muzZqo1nDgQ="

	fmt.Println(requestValidator.Validate(url, params, signature))
}
