//Installation
//$ dotnet add package RestSharp

//Request
var client = new RestClient("https://api-sbox.dnlsrv.com/cigateway/id/v2/match");
var request = new RestRequest(Method.POST);
request.AddHeader("Authorization", "y5jBqXWLzEF4OgK61EbJ4jbEesmxE5No");
request.AddHeader("Content-Type", "application/json");
request.AddHeader("Accept", "application/json");
request.AddHeader("RequestTime", "2022-08-01T09:33:43+00:00");
request.AddParameter(
    "application/json",
    "{\"merchantId\":\"02200013919FB4\",\"consentId\":\"9783471AFDB69NH34\",\"consentTimeStamp\":\"2020-08-20T12:00:57+00:00\",\"msisdn\":\"+14444441333\",\"correlationId\":\"984681AFDB698C67\",\"firstName\":\"Michael\",\"lastName\":\"Johnson\",\"address1\":\"3701 Ashwood Dr\",\"address2\":\"Apt 20\",\"city\":\"Council Bluffs\",\"state\":\"IA\",\"postalCode\":\"51501\",\"countryCode\":\"US\",\"nationalId\":\"345678901\",\"dateOfBirth\":\"19800303\"}",
    ParameterType.RequestBody
);
IRestResponse response = client.Execute(request);
