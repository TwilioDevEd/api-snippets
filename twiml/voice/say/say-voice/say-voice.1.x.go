package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say := &twiml.VoiceSay{}
	say.Message = "Bonjour! Je m'appelle Mathieu."
	say.Language = "fr-FR"
	say.Voice = "Polly.Mathieu"

	twimlResult, err := twiml.Voice([]twiml.Element{say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
