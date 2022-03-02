/* Checking delivery receipts for errors */

// get the list of aggregated delivery receipts
const aggregatedDeliveryReceipt = message.aggregatedDeliveryReceipt;

// retrieve delivery receipt status
if (aggregatedDeliveryReceipt.failed !== "none" || aggregatedDeliveryReceipt.undelivered !== "none") {
    // handle error
}

// get the list of delivery receipts
const detailedDeliveryReceipts = await message.getDetailedDeliveryReceipts();

detailedDeliveryReceipts.map((detailedDeliveryReceipt) => {
    // check delivery receipt status
    if (!detailedDeliveryReceipt.status === "undelivered" && !detailedDeliveryReceipt.status === "failed") {
        return;
    }

    // handle error. the error codes page: https://www.twilio.com/docs/sms/api/message-resource#delivery-related-errors
    if (detailedDeliveryReceipt.errorCode === 30006) {
        alert("The destination number is unable to receive this message.");
        return;
    }

    if (detailedDeliveryReceipt.errorCode === 30007) {
        alert("Your message was flagged as objectionable by the carrier.");
    }
});
