package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	redirect := &twiml.VoiceRedirect{}
	redirect.Url = "../nextInstructions"

	twimlResult, err := twiml.Voice([]twiml.Element{redirect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
