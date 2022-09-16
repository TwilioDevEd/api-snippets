import (
	"flag"
	"fmt"
	"net/http"
	"os"
	"testing"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/client"
	"github.com/twilio/twilio-go/twiml"
)

// The init function is a great place to prepare application state prior to execution
// In this case, parsing input flags to your app
func init() {
	testing.Init()
	flag.Parse()
}

// Helper method to determine if your Go code is being run in test mode
func IsTestRun() bool {
	return flag.Lookup("test.v").Value.(flag.Getter).Get().(bool)
	// Some teams may prefer to use env vars to indicate testing instead, such as
	// return os.Getenv("GO_ENV") == "testing"
}

// Custom Gin middleware that rejects non-Twilio requests
func requireValidTwilioSignature(validator *client.RequestValidator) gin.HandlerFunc {
	return func(context *gin.Context) {
		// Your url will vary depending on your environment and how your application is deployed
		// Modify this url declaration sample as necessary
		url := "https://some-digits.ngrok.io" + context.Request.URL.Path
		signatureHeader := context.Request.Header.Get("X-Twilio-Signature")
		params := make(map[string]string)
		context.Request.ParseForm()
		for key, value := range context.Request.PostForm {
			params[key] = value[0]
		}

		// Requests are validated based on the incoming url, parameters,
		// and the X-Twilio-Signature header.
		// If the request is not valid AND this isn't being run in a test env, return a 403 error
		if !validator.Validate(url, params, signatureHeader) && !IsTestRun() {
			fmt.Println("Request isn't from Twilio 🚫")
			context.AbortWithStatus(http.StatusForbidden)
			return
		}
		// If the request is valid, execute the next middleware (in this case, the route handler)
		context.Next()
	}
}

func main() {
	router := gin.Default()
	// Create a RequestValidator instance
	requestValidator := client.NewRequestValidator(os.Getenv("TWILIO_AUTH_TOKEN"))

	// Apply the requireValidTwilioSignature middleware to your route handler(s), before any
	// code that you want to only apply to validated requests
	router.POST("/sms", requireValidTwilioSignature(&requestValidator), func(context *gin.Context) {
		message := &twiml.MessagingMessage{
			Body: "Yay, valid requests!",
		}

		twimlResult, err := twiml.Messages([]twiml.Element{message})
		if err != nil {
			context.String(http.StatusInternalServerError, err.Error())
		} else {
			context.Header("Content-Type", "text/xml")
			context.String(http.StatusOK, twimlResult)
		}
	})

	router.Run(":3000")
}
