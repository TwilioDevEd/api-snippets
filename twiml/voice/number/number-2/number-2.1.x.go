package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	number1 := &twiml.VoiceNumber{}
	number1.PhoneNumber = "858-987-6543"

	number2 := &twiml.VoiceNumber{}
	number2.PhoneNumber = "415-123-4567"

	number3 := &twiml.VoiceNumber{}
	number3.PhoneNumber = "619-765-4321"

	dial.InnerElements = []twiml.Element{number1, number2, number3}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
