/* Retrieving Delivery Receipts (aggregated and detailed) for rendering */

import {
    AggregatedDeliveryReceipt,
    DeliveryAmount,
    DeliveryStatus,
    DetailedDeliveryReceipt
} from "@twilio/conversations";

const aggregatedDeliveryReceipt: AggregatedDeliveryReceipt | null = message.aggregatedDeliveryReceipt;

// get amount (DeliveryAmount) of participants with particular delivery status
const deliveredReceipts: DeliveryAmount = aggregatedDeliveryReceipt?.delivered;
const failedReceipts: DeliveryAmount = aggregatedDeliveryReceipt?.failed;
const readReceipts: DeliveryAmount = aggregatedDeliveryReceipt?.read;
const sentReceipts: DeliveryAmount = aggregatedDeliveryReceipt?.sent;
const undeliveredReceipts: DeliveryAmount = aggregatedDeliveryReceipt?.undelivered;
// get the amount of participants which have the status for the message
const totalReceipts: number = aggregatedDeliveryReceipt?.total;

if (undeliveredReceipts !== "none") {
    // some delivery problems
    alert(`Out of ${totalReceipts} sent messages, ${deliveredReceipts} were delivered, ${failedReceipts} have failed.`);
}

// get the list of of delivery receipts
const detailedDeliveryReceipts: DetailedDeliveryReceipt[] = await message.getDetailedDeliveryReceipts();

detailedDeliveryReceipts.map((detailedDeliveryReceipt) => {
    // get status of the delivery receipts
    const receiptStatus: DeliveryStatus = detailedDeliveryReceipt.status;
});
