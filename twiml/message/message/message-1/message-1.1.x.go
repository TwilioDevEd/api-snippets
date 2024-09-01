package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	response := &twiml.MessagingMessage{}
	response.Body = "Store Location: 123 Easy St."

	twimlResult, err := twiml.Messages([]twiml.Element{response})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
