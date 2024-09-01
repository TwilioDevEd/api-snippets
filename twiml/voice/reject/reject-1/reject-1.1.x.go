package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	reject := &twiml.VoiceReject{}

	twimlResult, err := twiml.Voice([]twiml.Element{reject})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
