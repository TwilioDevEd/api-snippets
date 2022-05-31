/* Retrieving Delivery Receipts (aggregated and detailed) for rendering */

const aggregatedDeliveryReceipt = message.aggregatedDeliveryReceipt;

// get amount (DeliveryAmount) of participants with particular delivery status
const deliveredReceipts = aggregatedDeliveryReceipt?.delivered;
const failedReceipts = aggregatedDeliveryReceipt?.failed;
const readReceipts = aggregatedDeliveryReceipt?.read;
const sentReceipts = aggregatedDeliveryReceipt?.sent;
const undeliveredReceipts = aggregatedDeliveryReceipt?.undelivered;
// get the amount of participants which have the status for the message
const totalReceipts = aggregatedDeliveryReceipt?.total;

if (undeliveredReceipts !== "none") {
    // some delivery problems
    alert(`Out of ${totalReceipts} sent messages, ${deliveredReceipts} were delivered, ${failedReceipts} have failed.`);
}

