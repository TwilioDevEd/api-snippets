// get the list of of delivery receipts
const detailedDeliveryReceipts: DetailedDeliveryReceipt[] = await message.getDetailedDeliveryReceipts();

const statusMap = {};

detailedDeliveryReceipts.map((detailedDeliveryReceipt) => {
    // get status of the delivery receipts
    const receiptStatus: DeliveryStatus = detailedDeliveryReceipt.status;
    const participantSid: string = detailedDeliveryReceipt.participantSid;
    statusMap[participantSid] = receiptStatus;

});
