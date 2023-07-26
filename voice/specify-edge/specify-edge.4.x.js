const accountSid = process.env.ACCOUNT_SID;
const apiKeySid = process.env.API_KEY_SID;
const apiKeySecret = process.env.API_KEY_SECRET;

const toNumber = process.env.TO_NUMBER;
const fromNumber = process.env.FROM_NUMBER;

const client = require('twilio')(
    apiKeySid,
    apiKeySecret, {
        accountSid: accountSid,
        edge: 'dublin',
        region: 'ie1'
    });

client.calls
    .create({
        twiml: '<Response><Say>Ahoy from Ireland</Say></Response>',
        to: toNumber,
        from: fromNumber
    });
