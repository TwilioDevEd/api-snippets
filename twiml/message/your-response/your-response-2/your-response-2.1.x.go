package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	message1 := &twiml.MessagingMessage{}
	message1.Body = "This is message 1 of 2."

	message2 := &twiml.MessagingMessage{}
	message2.Body = "This is message 2 of 2."

	twimlResult, err := twiml.Messages([]twiml.Element{message1, message2})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
