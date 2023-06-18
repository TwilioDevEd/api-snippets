package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Hello!"

	twimlResult, err := twiml.Voice([]twiml.Element{say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
