const twilio = require('twilio')
const express = require('express')
const bodyParser = require('body-parser')

const app = express()
app.use(bodyParser.text({type:"*/*"}));

const publicUrl = process.env.PUBLIC_URL
const twilioAuthToken = process.env.TWILIO_AUTH_TOKEN

app.post('/my-webhook-url', (req, res) => {
    console.log()
    console.log("------------------------------------------------")

    const rawBody = req.body
    
    // validate the signature
    if (!twilio.validateRequestWithBody(
        twilioAuthToken,
        req.headers['x-twilio-signature'],
        publicUrl+req.originalUrl,
        rawBody
    )){
        console.log("Invalid signature. Discarded event.")
        return "Invalid signature"
    }
    console.log("Valid signature. Processing event.")

    // parse the body
    const body = JSON.parse(rawBody)
    body.forEach(event => {
        console.log("Received event")
        console.log("\tType: " + event["type"])
        console.log("\tTimestamp: " + event["time"])
        console.log("\tRaw event: " + JSON.stringify(event))
    }); 
    
    console.log("------------------------------------------------")
    console.log()

    res.send('OK')
})


const port = 8080
app.listen(port, '0.0.0.0', () => {
  console.log(`Listening on port ${port}`)
})