// get the list of of delivery receipts
const detailedDeliveryReceipts = await message.getDetailedDeliveryReceipts();

const statusMap = {};

detailedDeliveryReceipts.map((detailedDeliveryReceipt) => {
    // get status of the delivery receipts
    const receiptStatus = detailedDeliveryReceipt.status;
    const participantSid = detailedDeliveryReceipt.participantSid;
    statusMap[participantSid] = receiptStatus;

});
