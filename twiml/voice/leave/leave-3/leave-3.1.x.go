package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	leave := &twiml.VoiceLeave{}

	twimlResult, err := twiml.Voice([]twiml.Element{leave})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
