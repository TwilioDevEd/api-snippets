// Installation
// npm install api --save

// Request
const sdk = require('api')('@boku/v4.4.1#1b5wc11kl6dx748s');

sdk.postV1Phoneidresult({
  merchantId: '02200013919FB4',
  subMerchantId: '00DF00000016',
  correlationId: '984681AFDB698C67',
  associationKey: '244464DFCB537E56',
  match: {consumerMdn: '+14085040458'}
}, {
  authorization: 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No',
  requesttime: '2022-08-01T09:33:43+00:00'
})
  .then(({ data }) => console.log(data))
  .catch(err => console.error(err));
