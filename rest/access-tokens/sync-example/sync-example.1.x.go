package main

import (
	"fmt"
	"os"

	"github.com/twilio/twilio-go/client/jwt"
)

func main() {
	// Get your Account SID from https://twilio.com/console
	// To set up environment variables, see http://twil.io/secure
	// Required for all types of tokens
	var twilioAccountSid string = os.Getenv("TWILIO_ACCOUNT_SID")
	var twilioApiKey string = os.Getenv("TWILIO_API_KEY")
	var twilioApiSecret string = os.Getenv("TWILIO_API_SECRET")
	var twilioSyncService string = os.Getenv("TWILIO_SYNC_SERVICE_SID")

	params := jwt.AccessTokenParams{
		AccountSid:    twilioAccountSid,
		SigningKeySid: twilioApiKey,
		Secret:        twilioApiSecret,
		Identity:      "user",
	}

	jwtToken := jwt.CreateAccessToken(params)
	syncGrant := &jwt.SyncGrant{
		ServiceSid: twilioSyncService,
	}

	jwtToken.AddGrant(syncGrant)
	token, err := jwtToken.ToJwt()

	if err != nil {
		error := fmt.Errorf("error: %q", err)
		fmt.Println(error.Error())
	}

	fmt.Println(token)
}
