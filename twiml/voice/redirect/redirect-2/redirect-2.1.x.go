package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Number = "415-123-4567"

	redirect := &twiml.VoiceRedirect{}
	redirect.Url = "http://www.foo.com/nextInstructions"

	twimlResult, err := twiml.Voice([]twiml.Element{dial, redirect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
