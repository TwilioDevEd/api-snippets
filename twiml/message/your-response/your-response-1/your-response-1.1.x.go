package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	message := &twiml.MessagingMessage{}

	msgBody := &twiml.MessagingBody{}
	msgBody.Message = "Hello World!"

	message.InnerElements = []twiml.Element{msgBody}

	redirect := &twiml.MessagingRedirect{}
	redirect.Url = "https://demo.twilio.com/welcome/sms/"

	twimlResult, err := twiml.Messages([]twiml.Element{message, redirect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
