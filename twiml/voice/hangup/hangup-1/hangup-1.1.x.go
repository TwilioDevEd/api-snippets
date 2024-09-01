package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	hangup := &twiml.VoiceHangup{}

	twimlResult, err := twiml.Voice([]twiml.Element{hangup})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
