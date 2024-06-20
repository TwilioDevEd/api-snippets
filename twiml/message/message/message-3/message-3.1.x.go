package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	response := &twiml.MessagingMessage{}

	response.Body = "Store Location: 123 Easy St."
	response.Action = "/SmsHandler.php"
	response.Method = "POST"

	twimlResult, err := twiml.Messages([]twiml.Element{response})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
