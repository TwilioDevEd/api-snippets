package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	reject := &twiml.VoiceReject{}
	reject.Reason = "busy"

	twimlResult, err := twiml.Voice([]twiml.Element{reject})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
