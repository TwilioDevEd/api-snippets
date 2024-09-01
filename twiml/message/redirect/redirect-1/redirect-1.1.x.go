package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	response := &twiml.MessagingRedirect{}

	response.Url = "http://www.example.com/nextInstructions"

	twimlResult, err := twiml.Messages([]twiml.Element{response})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
