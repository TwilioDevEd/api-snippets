package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "You will now be connected to an agent."

	twimlResult, err := twiml.Voice([]twiml.Element{say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
