package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	pay := &twiml.VoicePay{}

	twimlResult, err := twiml.Voice([]twiml.Element{pay})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
