package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	response := &twiml.MessagingMessage{}

	responseBody := &twiml.MessagingBody{}
	responseBody.Message = "Store Location: 123 Easy St."

	responseMedia := &twiml.MessagingMedia{}
	responseMedia.Url = "https://demo.twilio.com/owl.png"

	response.InnerElements = []twiml.Element{responseBody, responseMedia}

	twimlResult, err := twiml.Messages([]twiml.Element{response})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
