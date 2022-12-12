// Installation
// $ npm install api --save

// Request
const sdk = require('api')('@boku/v4.4.1#1b5wc11kl6dx748s');

sdk.postV2Match({
  merchantId: '02200013919FB4',
  consentId: '9783471AFDB69NH34',
  consentTimeStamp: '2020-08-20T12:00:57+00:00',
  msisdn: '+14444441333',
  correlationId: '984681AFDB698C67',
  firstName: 'Michael',
  lastName: 'Johnson',
  address1: '3701 Ashwood Dr',
  address2: 'Apt 20',
  city: 'Council Bluffs',
  state: 'IA',
  postalCode: '51501',
  countryCode: 'US',
  nationalId: '345678901',
  dateOfBirth: '19800303'
}, {
  authorization: 'y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No',
  requesttime: '2022-08-01T09:33:43+00:00'
})
  .then(({ data }) => console.log(data))
  .catch(err => console.error(err));
