package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	msg := &twiml.MessagingMessage{}
	msg.Body = "I'm hungry!"

	twimlResult, err := twiml.Messages([]twiml.Element{msg})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
